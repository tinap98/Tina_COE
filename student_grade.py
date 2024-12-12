def score_computation(project_score, internal_score, external_score):
    if project_score > 50 and internal_score > 50 and external_score > 50:
        project_score = project_score * 0.70
        internal_score = internal_score * 0.10
        external_score = external_score * 0.20
        total_score = project_score + internal_score + external_score

        if total_score > 90:
            print("Grade: A")
        elif 80 < total_score <= 90:
            print("Grade: B")
        elif 60 < total_score <= 80:
            print("Grade: C")
        elif total_score <= 60:
            print("Grade: D")
        print(f"Total score: {total_score:.2f}")
    else:
        if project_score < 50:
            print("Couldn't compute since you failed to get above 50% in project score.")
        if internal_score < 50:
            print("Couldn't compute since you failed to get above 50% in internal score.")
        if external_score < 50:
            print("Couldn't compute since you failed to get above 50% in external score.")
        if project_score < 50 and internal_score < 50 and external_score < 50:
            print("Couldn't compute since you failed to get above 50% in all of them.")

    print(f"Project score: {project_score:.2f}, Internal score: {internal_score:.2f}, External score: {external_score:.2f}")



project_score = float(input("Enter the project score: "))
internal_score = float(input("Enter the internal score: "))
external_score = float(input("Enter the external score: "))

score_computation(project_score, internal_score, external_score)
