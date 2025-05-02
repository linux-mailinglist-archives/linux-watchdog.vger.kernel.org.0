Return-Path: <linux-watchdog+bounces-3418-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 633F9AA7559
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 16:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC20846691D
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 14:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45582561C7;
	Fri,  2 May 2025 14:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="audcEK4/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266A92561B9
	for <linux-watchdog@vger.kernel.org>; Fri,  2 May 2025 14:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746197625; cv=none; b=EPc070v6iysSLctu5FmlZc3dao5OQ65XUNxVjO5fKX9Q8ssq1fnsXhKqdtXD8zdNRRRvHtfTGSHP5SfW0WZHqX4awlq7QMHsbFTQxnQWIPHiXuaa8bt2Nekp25PwP4p/3QVo52Kx+Uc++cc8xr+e2IOrhzlCFODPSW1lC/KWXwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746197625; c=relaxed/simple;
	bh=K0E7yI1Xa7NXgaLdR9InXOsO/qfXVkW7JBH64HPB6Pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7AigPmaMpWiVlvC7725xLw12oJM4tX4+WRWWrCX9La01TdLtAv8t8UQINjBykjxZsBxjAjOvP/a5SnNM1a7AmX6ds0/Qo58zgVaIiifXyk2n1O3z903w8vlz4T8901ggUbkqCYY5MWQngzi7nyFzODLmFArHYSoVSpzyrIOdQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=audcEK4/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542CZnER002472
	for <linux-watchdog@vger.kernel.org>; Fri, 2 May 2025 14:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9Q/NZ9PH3dCqRhE7QQVcQF21
	ld09o2KwGMTJ6V+d9kc=; b=audcEK4/k0zX/8UCBf7tbrLnDMFLoeeB+WoYk6sX
	bdhKt3cPonIN1CUZyvmlh7aA/8aB2IlU6ZLvUJuY9Uv74UHZn8+DBvpkSZvWskbk
	7EH726tUViDOshuC1FHJzRrhanMoNX1MU96UL65gbNXtfoZqXu8RRRx4Kxpo03om
	BxtYb2LqRyAQ5P4r98xPmY+TamSDVo6YZ0tfTagN1t3VwIXLlPVuWj8CVvqT3ApG
	q/zzfn041uoIUSc8Kdn7D0MuoweKb7JzYMopZHJH412Z7EM78kFezuHvBqAmx/Mu
	NUq5uMCIRq1mYDf2gj2jB5bCQexg+u7asr+uH13tn0gZ6w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u78rds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 14:53:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c0c1025adbso443691485a.1
        for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 07:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746197622; x=1746802422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Q/NZ9PH3dCqRhE7QQVcQF21ld09o2KwGMTJ6V+d9kc=;
        b=ivhXjPQWpXy8GU2jnFRzpaF9VF72XcRhIwaPhP4cP8LhRWFZhLp9Imh+Bf5TwkEx9/
         bRiUBPZbB4JdzDU852TFqXgSMNV9bVvVKVhrlUfWAD6CCDAXWlua741rsHVXM7a1NUa4
         gaNBuZPoJUh9Ow8+AVQ7JGnSEGa2Jfu2vHDacnioE1Jq8A6tBe1ebHE2yxEZgICB6RxI
         7PGrmvNYndmYBUs2hBRJWcQcvAdl6FWwf+mVj3aZW0cjGKRIIhJe+M5yL0dTUsW39/U5
         G4ELJLFDHxd03B4/CHY+xX55bUuIkcviNdR4koWLNm75g7TIwbvWbg3f3qVrwB4RdaVa
         mj6w==
X-Forwarded-Encrypted: i=1; AJvYcCVcA36Qn1KBsHoisceWb3OUi5V4yJxM5SZRwM9VvUA9sDD1lNY9T/TE25tOenCo/VFuyRBjqE0gAJQVMPcrLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPQV36h9cLqykawFJNpX96Ay+j+bKdhqjCQ0FoWcdCyppiJ8fT
	sf8NLuyBx0kdrnK0BAO9EtKgp3YFuDnEYuZotC646NC75XWM1uZ3wEgw6YQTkcj3x1tk4CP++n1
	WTMf1qpFMAk8aozI3Wzaa2tQFBJdnPLBTS/AUE5gG2DqTVZ2K+JI5UWj3NxWdmOBdng==
X-Gm-Gg: ASbGnct1z6SEkaedAA5S9tJgr+XqQ9UjzzyvFnPHx0J2Zlnl0RE4QKLCucEvGlkE1CZ
	DuzNC0NUfuqjK5gucKSQX90bdlLGxDPTdDPYRViKguAL9NlnGL0hOv45yd4p1oGrT7fesv+RJjn
	G2eYmUv+Hbqvdg+UDqfe9DxxKUimc7HwB72uYRtd3VJHYGtwJBMwF1FijrXWU895rTerfnFZIrc
	iQIz0inx6Yy5tnXNEVJScaNliCu0Ai993oLYr1sMPK9gUNvP19nHeTewra+dwBd0CcSQXMctjjI
	/E230SheivbpCGGMbh3n35k4DQ6KNNjFFJs7Pd7K734etcIGC/rINlW+/ilkYov4DBDspNEURao
	=
X-Received: by 2002:a05:620a:4442:b0:7c5:9a4e:7b8a with SMTP id af79cd13be357-7cad5ba5b8emr552666885a.54.1746197621885;
        Fri, 02 May 2025 07:53:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv+2rgqKEXz5KX4ZAVjm6VR2mlcVmss6vo6U4HwP0A0n7q94Lv0z/IsqE8QQF1nfQDyCLaxw==
X-Received: by 2002:a05:620a:4442:b0:7c5:9a4e:7b8a with SMTP id af79cd13be357-7cad5ba5b8emr552661985a.54.1746197621395;
        Fri, 02 May 2025 07:53:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f15ddsm375752e87.159.2025.05.02.07.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 07:53:40 -0700 (PDT)
Date: Fri, 2 May 2025 17:53:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, bod.linux@nxsw.ie,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 3/4] watchdog: qcom: introduce the device data for
 IPQ5424 watchdog device
Message-ID: <4fvlhcztwqw3sp4wb32rbvdra5ativo5zypeokpglzezkmjfmy@vogadyshroix>
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-3-b2dc7ace38ca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502-wdt_reset_reason-v3-3-b2dc7ace38ca@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDExOCBTYWx0ZWRfXyHsRUGm5imMn s7uZCX5nnSqumm67ZzinnWL+iWDSj6kjLX56Gb2WL9KwCX6Go6UqduTU6HZ8R7kqjpPvdiBjD5d LJQNm5gaLvhfa4/JQok3r1oU2xfoe2PB6qxXzSINxUQ6EqyyKrQQF+aZm+XpY2ijcZQ/UW9XIV7
 0F/VNHISU+AsKl7am7zqbvafWI86ntBWJtONVkc2QKCCS8CS1FDhzKrAsePd+IJBLkcmhydfMPl +9Tux7ei2VZQNQzbPtT3n0cTaXDkmXLlt5N2VcOWi37aD0Mexr7qiiO8Xr3ixTPVT/ki4ZFaEuv sppQ42c12TgdAP6VN8/MJrM/gXlDbKI87hNco+tS+HIuam7eOtwG6uj/otXSuFGOOotLtIFcF8p
 7AV0WLAXqVveF+0jW6alxXFeb63mmh0FaxFVhIa3rIfG9R0T7cVRkO4ag7+aguHf1WnRM0Zf
X-Proofpoint-GUID: RQH-VcUl-IZ8d1MPUYh3W6YUh2FbdHZh
X-Authority-Analysis: v=2.4 cv=W404VQWk c=1 sm=1 tr=0 ts=6814dc77 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=eHhXNMzxjzR4xej-uuwA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: RQH-VcUl-IZ8d1MPUYh3W6YUh2FbdHZh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020118

On Fri, May 02, 2025 at 06:47:51PM +0530, Kathiravan Thirumoorthy wrote:
> To retrieve the restart reason from IMEM, certain device specific data
> like IMEM compatible to lookup, location of IMEM to read, etc should be
> defined. To achieve that, introduce the separate device data for IPQ5424
> and add the required details subsequently.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v3:
> 	- New patch
> ---
>  drivers/watchdog/qcom-wdt.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index 006f9c61aa64fd2b4ee9db493aeb54c8fafac818..dfaac5995c84c1f377023e6e62770c5548528a4c 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -181,6 +181,12 @@ static const struct qcom_wdt_match_data match_data_apcs_tmr = {
>  	.max_tick_count = 0x10000000U,
>  };
>  
> +static const struct qcom_wdt_match_data match_data_ipq5424 = {
> +	.offset = reg_offset_data_kpss,
> +	.pretimeout = true,
> +	.max_tick_count = 0xFFFFFU,
> +};
> +
>  static const struct qcom_wdt_match_data match_data_kpss = {
>  	.offset = reg_offset_data_kpss,
>  	.pretimeout = true,
> @@ -322,6 +328,7 @@ static const struct dev_pm_ops qcom_wdt_pm_ops = {
>  };
>  
>  static const struct of_device_id qcom_wdt_of_table[] = {
> +	{ .compatible = "qcom,apss-wdt-ipq5424", .data = &match_data_ipq5424 },

Shouldn't it be qcom,ipq5424-apss-wdt ?

>  	{ .compatible = "qcom,kpss-timer", .data = &match_data_apcs_tmr },
>  	{ .compatible = "qcom,scss-timer", .data = &match_data_apcs_tmr },
>  	{ .compatible = "qcom,kpss-wdt", .data = &match_data_kpss },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

