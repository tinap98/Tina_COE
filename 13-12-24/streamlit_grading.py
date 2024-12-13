import streamlit as st

project_score = st.number_input("Enter the project score:", min_value=0, max_value=100, step=1)
internal_score = st.number_input("Enter the internal score:", min_value=0, max_value=100, step=1)
external_score = st.number_input("Enter the external score:", min_value=0, max_value=100, step=1)

if st.button("Calculate the overall grade of the student"):
    if project_score > 50 and internal_score > 50 and external_score > 50:
        weighted_project_score = project_score * 0.70
        weighted_internal_score = internal_score * 0.10
        weighted_external_score = external_score * 0.20

        total_score = weighted_project_score + weighted_internal_score + weighted_external_score

        if total_score > 90:
            st.success("Grade: A")
        elif 80 < total_score <= 90:
            st.success("Grade: B")
        elif 60 < total_score <= 80:
            st.success("Grade: C")
        elif 50 < total_score <= 60:
            st.success("Grade: D")
        else:
            st.error("Grade: F")

        st.success(f"Total Score: {total_score:.2f}")
    
    else:
        if project_score < 50:
            st.info("Could not compute because your project score is below 50%.")
        if internal_score < 50:
            st.info("Could not compute because your internal score is below 50%.")
        if external_score < 50:
            st.info("Could not compute because your external score is below 50%.")
        if project_score < 50 and internal_score < 50 and external_score < 50:
            st.info("You failed in all three categories (project, internal, and external scores).")

    st.info(f"Original Scores - Project: {project_score}, Internal: {internal_score}, External: {external_score}")
