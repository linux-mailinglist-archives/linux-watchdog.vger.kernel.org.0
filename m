Return-Path: <linux-watchdog+bounces-4587-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9689C5CC55
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 12:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3283A3A67F0
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 11:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFFF830F7F7;
	Fri, 14 Nov 2025 11:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aghzwQbg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D+M9TUyl"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509FF2C1786
	for <linux-watchdog@vger.kernel.org>; Fri, 14 Nov 2025 11:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763118632; cv=none; b=mAtynlSYAWjh60QF0UGmSUUqFZh1FkA8EiEQ7IkqEG7sgMaUHfja7DSzH+Y4En1jCHAS0ajzCWI4RQULzbUQanGkUgSsGxxxWoOjYPWG/+/nI9vb8EuXJEgTA5e+1UNGQ1EVdxq7NTbfaEWIKdOuxGjuPEUY0hWjjNg0lur0lK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763118632; c=relaxed/simple;
	bh=1u/88aZEkYnOHobNaJAku5jCR7tdg9UiWQJnsk0/MpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgOZlTpjrqgB3uC67bSNIOLnbQ7bH80WYxl9aR+y7eZjx4GHm5t/CxBd8+Qx8YXuNiY6Hr1JBSi3jyUZDOMlznUbuzrnpeZARCUnjHq4LOWtwtkFoXmEshpV8rZUtWumpxZBSIPpzgCt1FPqDE05c2oMwCXraBzLNw4UvFQ+0cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aghzwQbg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D+M9TUyl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8cSov1685314
	for <linux-watchdog@vger.kernel.org>; Fri, 14 Nov 2025 11:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8LtvBIz7uXrsDF0GFSJSBjqW
	FQe++2p+MCy95jT0PIo=; b=aghzwQbgVd7YbNYn45vsteO4jSkRX3uQr7AoVcjy
	pEWhOFYo9Ppqfx7ZwkW9Dk5/P80kwEmcos1XuCimXy9B5D3+7HOIc6fHYW7VU3XZ
	tzi1cDrKKqS/FV0MnjFTqUgrsYLeli5xIeLdhrAPc//RI6c/+7CPlcSQxfK4zjIG
	zztx2BotX8jj9tUjAYAr6T1tkNtBktykf1py14rA2hRFHCbMPlFZ4rDNb4bJBLqu
	NJxAY6uyTD9iLH7y1Pgb0PXoNLYrCyGtoN7X+IcxDM5zRLCePJd9kvp0SHSyid5N
	GghPK9S3w7sEfWPkfgqPsBDJRQo+WrZSiYDtteEbBt5Uug==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g1x6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 14 Nov 2025 11:10:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edb205b610so19237321cf.0
        for <linux-watchdog@vger.kernel.org>; Fri, 14 Nov 2025 03:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763118630; x=1763723430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8LtvBIz7uXrsDF0GFSJSBjqWFQe++2p+MCy95jT0PIo=;
        b=D+M9TUyldW3nqjGkY34bAHqWBS0yJE5zx3dnhLsezIanBm4mQp2VoI1tTNF49cpIFo
         /6DVJ06U0GXI9uUZbYvtuEBmb59iXfID1egmS3Br6OwgJ4GfeU2i7I4yaGwBv0NEVX+Q
         LrerxqiiNYhORw6DSW9qDA1Y19iCsLcWoMqWXe1hIeKW4vxt6ymE/d199yS1AVbnKk8O
         dbkrudWQHcpgTLAv+6fGsZ/fyWPWPLxj7uimsQOYz6cpZIio0BAUSfF0S27B1Z7D5vIC
         tjb7ZQ4j5etboa+3DjwrQ2CO8UaaAqyA4Epss1RHju5PFIRlDv4ZgdXuVscrRft3QAub
         SsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763118630; x=1763723430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8LtvBIz7uXrsDF0GFSJSBjqWFQe++2p+MCy95jT0PIo=;
        b=oOqQvYYqY2zohp94T45tOz6JUEuV4zLG8Gy2ZGUJMkxng6SunDIBfinWYMltN6V9iR
         U2xQZenDZx35FtXNIHpR3FwLkcoF05ok28YePpUX9cdIlDrnr4UgdYCeivoNBzqdssb+
         v9eVQ/qLmJ19QPyNBIdce6QB0xQNNIzGDOOpD8gMZYZwLDDXN8KWl2aCNWAYfWX+KkSl
         YsNE8ua+EGidUBuJ7CPt9f48YCV4y4E0nuKMiDBWV3Z4nI39P5vwk8u1xw0oN0Vjr1oA
         NlFFjpP/PoeFf4uzTV4cAYoEeCOW5tuiKFKqHX5SAx1jisOj2Vu9FrrHpHOYEeFwBhU9
         wxEw==
X-Forwarded-Encrypted: i=1; AJvYcCWhyoVnBhIggj7UwlDb4+JgBrBQ+NgdLuo9ZG6JZ07yUffgxJmmom/MkfMQf33sKTgUdRl6oFqjhHlDzNLcvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ529MtkwDJbljtrVYn2gk+dquYOOhVALiJaypYx140s6CS4Ew
	VTiMHrAzHFXQjjsBpl2VtEQuJ9kt1PNUh/RM8o6ti/FbH8EYDGTeE9d0mR774M3vypyIuZOeLfL
	IOpI2ufpDFGOGNQXQPxOltGDgbyspIsj/+0dh2lmpDby7VVooSTusotrCbox7MNtusCcjSg==
X-Gm-Gg: ASbGncv2267MeQKMl9oLZB/RMl0Uox0bwAc+bKnhPu6UzX8laTRWVqieC7kCyPUjlnM
	MEUe9xZUkeBBBOzF4nr+bpJ4dEycn3WGEt0HPThFbbeKhSuLZork2wGMJ+JlbbYixw0ipTUZUiJ
	p3fMQCBIyx7KUFnnpeDtxIknZnyaVtrAUd/30cLHYSXHOdLOgKU0fjJXqOdm68+Zqf7AQdkNLpH
	rtpDsQzYF2w0eazrzMhV8f60dhQO0R4AfUksunEJvF9cm3wtDaAMUKf995vU6rmSjbdZDvwpswV
	UttMi2QOYLPom7zhVF2CX87d9QlX7fULf9ZQChH7f69228zYOZ6GzTUrODNLfmFeDD7s06VncFB
	qD6SjPlYUEx/4uF7+j7ZJXAtsYLmsaYgEfpSptZsNvUJ9BlrkBxsEkXe9iMoSaKPj2VNFvlPwg3
	5Gf4lVPhwEVhcx
X-Received: by 2002:ac8:5d05:0:b0:4eb:a3fb:2864 with SMTP id d75a77b69052e-4edf21369c2mr35563671cf.69.1763118629562;
        Fri, 14 Nov 2025 03:10:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIXQ9h0ZcSZlAXsW1jowVrI+xWvjDN8XhdTK/MeV7rPhtP5nNmOWKML7enJxk3NyGMdXK0pA==
X-Received: by 2002:ac8:5d05:0:b0:4eb:a3fb:2864 with SMTP id d75a77b69052e-4edf21369c2mr35563251cf.69.1763118629013;
        Fri, 14 Nov 2025 03:10:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804004b5sm990934e87.64.2025.11.14.03.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:10:28 -0800 (PST)
Date: Fri, 14 Nov 2025 13:10:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: hrishabh.rajput@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 1/2] firmware: qcom: scm: Register gunyah watchdog
 device
Message-ID: <tidx5vumsk2vnofoy6cp6unfn34kb4prmkh35xocbzafj55pxb@x2x5cqynofs6>
References: <20251114-gunyah_watchdog-v7-0-f5c155b941d5@oss.qualcomm.com>
 <20251114-gunyah_watchdog-v7-1-f5c155b941d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-gunyah_watchdog-v7-1-f5c155b941d5@oss.qualcomm.com>
X-Proofpoint-GUID: xK9v76BOdrN-S-I9Z-q0EcovO7AP5oE8
X-Proofpoint-ORIG-GUID: xK9v76BOdrN-S-I9Z-q0EcovO7AP5oE8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA4NyBTYWx0ZWRfX9S2J9BXEau8k
 oQ1Zcry57DjeaSTxhPUwYs9DNgqjYJQvBFTeuKBfId5DA1koq+zp2B7J7xaGSPawi95U9bE9OG/
 izLGH7dDKJYV0Bhbvo1ho9kFCwvIj+gD48+JgUIjEftcO9QodlZGfGacyDxA9tY3mjsyTEOBTus
 CBsYaGpXgIw6onF8KSCBobE9rL/7jm4co/vqtvayiHrlMss6dq9aYENyRzJ8hGKzJ+6+ppC6p/h
 LTf0ZwQMtnae6ky7iCrGCjS4nM4581B/Wn78onTclsWFx4ej7cNmusRRONktaVlH5FVDB3ySCWs
 TlGZrP9bGphYxWwv02MAaimAgC4mKN+qd9CzQySezakFG41J4I9Oyfuxx5ky8ctUeS29hxQd9as
 t/PEFjRv1YtxHrL1ssWUJIg3wNWdHA==
X-Authority-Analysis: v=2.4 cv=IM8PywvG c=1 sm=1 tr=0 ts=69170e26 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vhl0b9cZdAc7jHreLUQA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140087

On Fri, Nov 14, 2025 at 07:57:09AM +0000, Hrishabh Rajput via B4 Relay wrote:
> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> 
> To restrict Gunyah watchdog initialization to Qualcomm platforms running
> under the Gunyah Hypervisor, register the watchdog device in the QCOM
> SCM driver.
> 
> When Gunyah is not present or Gunyah emulates MMIO-based watchdog, we
> expect Qualcomm watchdog or ARM SBSA watchdog device to be present in
> the devicetree. First, we make sure we're running under the Gunyah
> Hypervisor. Then we move to check if any of the above mentioned
> watchdog device nodes are present, if not then we proceed to register
> the SMC-based Gunyah watchdog device.
> 
> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 53 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

