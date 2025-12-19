Return-Path: <linux-watchdog+bounces-4721-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 44767CD03E4
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 Dec 2025 15:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B040430239ED
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 Dec 2025 14:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F39619AD5C;
	Fri, 19 Dec 2025 14:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RdrwGOxT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jgl2vcGu"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FFD7FBA2
	for <linux-watchdog@vger.kernel.org>; Fri, 19 Dec 2025 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766154169; cv=none; b=LaWU1/qFlyUPvJWO9y/Bf+MpIxFju6EO8Iyi8VCtHt0GGfIqCcwL3OvA0q8BKa5x72T1OW4njRqD9LW4DYB34WbeAVcOxFbJWSAPnloOoW02R6jM1ZklmkejEGYI4V7fvV4PFSILhZmPu87/HlMzQxFlb1bbrst+AxMr9r2lMms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766154169; c=relaxed/simple;
	bh=rMPeP7cKewbJYaRXHJ9LTGVVwPU7cSSIGeM5jtItnjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxqG888aK4WMxL8hzLQMB/OEYdbdM4MQRNdXpjFWMH8qxjuTh//JoAhS5Cu4YgZqpkfx/IWIqGucWfOXC7znX4cd9/QojnDi9U1YnzaRjuAzJ6KTCQZCApAU30ycaxstqZH7xRSt9Wls7aiL5D7iEwD1gHR7UMdoQYW87xKec1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RdrwGOxT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jgl2vcGu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJB41Vl3939222
	for <linux-watchdog@vger.kernel.org>; Fri, 19 Dec 2025 14:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j7pvWsuXQJELObmI7x+PxidH
	a3S4nPSltcnRxt3AMN4=; b=RdrwGOxTS92vQXL0XzrALWtnwY8pkkTyD1hI9eHE
	+7JCyee5iA9Qn2lDpMA7n85oHBQyrA1kroUKu/keq1FrRENStGJdqffMCBkIc+db
	7F6rzWa7Tlovnz0Uajd8RD8ljnNKrqRBTylx7edBPZtJwlFQwn85dcwN6fBQ3xYq
	ic872HuUGGjnrNkaBYkBioEK3K97AYNevtK4OXb2lRlM9yhlT7aLlC+peUa2sb8G
	/TSO9rIvWmp5OES8C5ngKEfl6yR/NDQiziFnY/iyp8EogQNb3ZZGhC1qTEdWATrC
	ReY5lZPLen2JL0tpSJ701hWF4EB6iwsfV7rQ9MEK09yupA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c2xa7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 19 Dec 2025 14:22:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee21a0d326so31056261cf.3
        for <linux-watchdog@vger.kernel.org>; Fri, 19 Dec 2025 06:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766154165; x=1766758965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j7pvWsuXQJELObmI7x+PxidHa3S4nPSltcnRxt3AMN4=;
        b=jgl2vcGu0ILPcto2RWYKnGSnxufROmXNIBK2wPkH4E24tvceJqkrtVRRT6wdaU5i/x
         LEEI+kavmmGL1OHsyky/Yi//W/hB8E2ZsrTwQOauGvTZis+sRDxTnU0roQbIhjpxy0/8
         5Hkh5TD8xL6Nc1ObuPMbMZybb9nBm8pz//njodwS0RYu+K1GQCGBE3D9bIz1fUHaeVGD
         7FdvDzSAvRMoQ697COC1n7zNKnKJBCoDRp+XZp8b9YCJMbcmqHhLrq1c2v8vVEKO0ETU
         NKoAVicY/F8w9CUX8k8D8LAXCFn3Oc5UywFjWz/0Sz6rFleyb++MtydbYfrIZz5WJHj8
         J5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766154165; x=1766758965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7pvWsuXQJELObmI7x+PxidHa3S4nPSltcnRxt3AMN4=;
        b=Isz09jgkY6fZfzySA3XQO+HSHKQeegBYQnLsnjVfAGz8YDV3O8pmLp4Iaw/si09HNj
         P5MyPD7sNmfTrizy8sm7NMFCgImZn6lAwmyGprWkTD0OBraY9x2wdF/MlMVw/28xETqN
         QQ5rOQ/60ZJhOp3H6AinQD4SmTmdH9xDVGUj8v4DA7pGnZX5ssr2HFf7sYVfhv3+TCKi
         Cy50tRhRZR1yqWEbI2GziJnlhAkt+a2WW5t/aD3HiEEvTlCz14dRNcfOkSJKPH4dVT7e
         Lnw4ysDGzhdKRLRbBcPGlj+2kqaTEtpLxqqHp/bQcPnmhUkCxQWt5oQzVBpfDKMrRAWL
         Wl7A==
X-Forwarded-Encrypted: i=1; AJvYcCUjnGCNqMQqY65XjsgUrxXOE9m60q2UGK/P/5oRxIMk7yWvlDt6AVg8aBC5R+YwkLupXjqpLpu2Mb461Y6zog==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk4vjvyxDRz4a8cs20FMlB9gSXMLytRYQ0hTGxaYe9T/k5M1qm
	MPCFFBbXJyvyZ0ypelfWNl6+q9aAmxRyDp55spY200nHKqkFPLezf4X+J+P4zlXLsK5uUsvp2P/
	iOK0wwbWwak7n0wFtTTujGIU1cb9gK3wtBm8jge3u6FHFGNU8PyNRpz2yq0MrwVVFD/8wEw==
X-Gm-Gg: AY/fxX6LX+jq05ja9fNxBYO5csHuyGDVwgGHJ6C/kSzOntF5ssaLfcEONkdt6HhyDSP
	DHsVW5X7aHdTOOsKLo9OQd1T6BpAsITAHkcqTGG6APtnduZV1fLnE6hSfVSrfw7WgQ7EVrN7Bhy
	Zcbb7Rbb6tq9E3yUjuK1kHkpZOR9D0IpDl0YPt5OIUhS8rsS7zRFdzFQG69K7qr9xrlzmsXPhHo
	sXqmfzDe2TNlqPGo2Q/TwAWLHuxWDzHb4W6HAyLLOiXuu5cZdM/7RcfO84W6S3Ww0IU8kKOuao+
	XZX5soNi7Lso0MNcmZnarbywu4d4CVyXOzm5rRgwPWxEUU+xuas4c5wVf+xqpcnSl/gu8K4FVH6
	3nVZNXrAB+uYVANmfmF1BqZ+Yk7WlIA3nqe7kz+NiU8SrKAXtjPYiTQU6VCkUntkrZjSzM2430T
	46aHtcG8YvVK1cUFSA3ivS5jg=
X-Received: by 2002:ac8:6711:0:b0:4f1:b93d:fb5a with SMTP id d75a77b69052e-4f4b43de5dbmr9385851cf.7.1766154165035;
        Fri, 19 Dec 2025 06:22:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpIjNCeKhT5W85cgv+xOyI5yMUcQMZYD+21Fr3TzDVqSALOU0KA3phfoKOP4SKrKAH1vtQZw==
X-Received: by 2002:ac8:6711:0:b0:4f1:b93d:fb5a with SMTP id d75a77b69052e-4f4b43de5dbmr9385451cf.7.1766154164600;
        Fri, 19 Dec 2025 06:22:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185dd252sm722344e87.24.2025.12.19.06.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 06:22:43 -0800 (PST)
Date: Fri, 19 Dec 2025 16:22:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: x1-el2: Enable the APSS watchdog
Message-ID: <ti5ackdyyea2bzq4gyxdlbx4vksjqbrk645g4ebmkf24xgiu6d@rcdnewuwndc7>
References: <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-0-fdfc6ba663e6@oss.qualcomm.com>
 <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-3-fdfc6ba663e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-3-fdfc6ba663e6@oss.qualcomm.com>
X-Proofpoint-GUID: FoCrIdllgm49FCDpQKUZN-yNQzG6_g4y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyMCBTYWx0ZWRfX+VSfN5EKkZqp
 9TMHYOAF3UrIav1tRNsoMUkTporgHNn/KrD+2A6atJr4PWc+YdfKOyuHgwvylIwB0L9zDOEB/hf
 K4wPJ8fJ9d8NJ5Ea52RvY2lkPmoBg9oYFUM1DJyb7aUnqz4amK4OSj/iNPfkXPOQWR4I1Os0fLb
 QRd/A+4f+ihXEFewScfe1bNoW2WWcu+9MV+isgLy8c684nDk4HA/FiYNf0JlkSe8Ox8XiNP57yB
 RTbxBjorj6b1443koke7sfzRr2BzN3NkxteBvmEXfMWi+p2AACuhDE70xkxZ2FLugLTDDFjXBiv
 gX0qgzoquGTzE8nRVqQci37oXRNoYF7fa6Q/+vg7kPJkeOtJZTwKZyh3ZqiQuSUBFguUAgAUqYi
 se80V1CdQDQ8fEcoGA2MkFxNXfciDWR0DNPLQBjfWzZSbjRGEvcHntUESkIDLKJfdcUf0pBvlvd
 PyinRgvmn3Sn00+uYWA==
X-Authority-Analysis: v=2.4 cv=feSgCkQF c=1 sm=1 tr=0 ts=69455fb6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=YcuGliB_beCyQ2iCDSYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: FoCrIdllgm49FCDpQKUZN-yNQzG6_g4y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190120

On Fri, Dec 19, 2025 at 12:00:30PM +0200, Abel Vesa wrote:
> In EL2, the APSS watchdog is available. So enable it in the overlay.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1-el2.dtso | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

