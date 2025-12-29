Return-Path: <linux-watchdog+bounces-4740-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF159CE6996
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Dec 2025 12:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 165C430084CE
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Dec 2025 11:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F3F2D481F;
	Mon, 29 Dec 2025 11:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nV+sZL9p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jLgaYJ+I"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0B12D594F
	for <linux-watchdog@vger.kernel.org>; Mon, 29 Dec 2025 11:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767008908; cv=none; b=vBjcVhRBYlgQiRTmxPBS9VNAikA65BIgexpNW6VVUA4DAEKCPQMyYrZrPewMwNst6iwL9kDwF91RQyvd8xYGltMkMXWzvQ/2TmCDwQ848Raw9hcetnjccKxi393lN2D1SR7z4NKvSI47Y5HNm3QT+QSyRgIXI9RJZgldldL604o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767008908; c=relaxed/simple;
	bh=fbErg+DAWCcYhV7EN7duW/Ip1YxF3oLKzJejmVLo95I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tCiv4Gd4HSGrTk/+6dTn9pGeCnJVbWRA9gVFQ8i8E02dGhECKMWwucxHFQeJh38nK0MWIn0KEH8DnMfDHoiX/+5f4nf4Pw4c0cFq7WkPwCqhiGnJwDKLEHjSYZxltwUXSB3tg2nBDa1DdQ9dwjKyqW6EqZqGGeVn+xyQ71mV6mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nV+sZL9p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jLgaYJ+I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTAlCDT3850328
	for <linux-watchdog@vger.kernel.org>; Mon, 29 Dec 2025 11:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	197vYatdgxzcBa15cIBvM/1x4eTpxhjqkNIKVJh5980=; b=nV+sZL9pVVZOMhlG
	lZvH33EjC6qOkdIbU2fX0wQ55+UagwgArCVaqP9EjPWoYeIdFAEdVYi7KkGhLZrq
	t/IsuJFOoaFt7ld/3otXz8x3+kFgdbfwhT8vcE204fxZTDLxv7zxGmpZHUguGKIT
	OQbK3O6HBdAGIZGcl4FrknFQl158YPyCpt8lcRvLBEG93WgJ7A7aD6GbOC0L5Nam
	+IQ4ESlVdZICg0ZAvmw5eFySwZQ8pSgiep5lxkqYRek+gcbWTKyjXLI4dT0S38dn
	bjj6LmuRVqS+z6w9++P92M/JKEzhxI7dhUC7kSjuFZ/WydF1pminakXzuTuDC2KU
	bu9Jhw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6dr4b5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Mon, 29 Dec 2025 11:48:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ede0bd2154so28840471cf.1
        for <linux-watchdog@vger.kernel.org>; Mon, 29 Dec 2025 03:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767008905; x=1767613705; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=197vYatdgxzcBa15cIBvM/1x4eTpxhjqkNIKVJh5980=;
        b=jLgaYJ+Io2u1T5wQjMP3rKM2vkPJPxk+wYEH3+kx/5DArNLHrShrzeTUkzEURyLgF3
         v8wIJf5hFCBuZIxp232WWSp6HjD3zISfile1HjhP6c4RpnTr29NMXhWq+L3RisDr9gkD
         UT1KgaxBCLnGz1vpwyoitvB4oF9Iu5uvwLwuE/aclPs1JPcDnOPEPuBmHzaS1eybYg4F
         BLS1cWm32gwfxVDwRgWRKkNpSLsZNUTHix+308Tk6yM4vcXlrOZj1VYhoVoLcQ6671Xj
         30vxc2GRE48zlz0upoXIb+nm2nCUdT9SFYliC6ZkDSo21jjbU2mW6vM6h1ThnI2qI9g2
         vhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767008905; x=1767613705;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=197vYatdgxzcBa15cIBvM/1x4eTpxhjqkNIKVJh5980=;
        b=SxEVnIlyWyEeDUDAuioxmSJA7E6y+fW8mLwUoPIic/CbKcRsLwLs08tdZzQ0Tnzxe7
         dYZ44nUX9+Cl61qhkT4f7nWQvBcDaWwhoH3MqqmA6YzvJQ4nKA5bkUg746k2q8TgAsqK
         WMqDnf7mquhzrqplkaSNkizbISLbRwIsblsLtLCuy+YPcr+ovlBV4qyEyXHttXEumsjY
         2jZgcmJnrniZ9kUR4dhnQmrbzk7U+6Zke2UfEVW/bwTfSACo7Zum0YO/Xk8azM1npYMm
         FylaN4luTaz+lz4Olma2u/iX5jcBdg6jm5CYODIiJKwsJPBuGr3IZtn1k0JwBteQyQic
         fjBg==
X-Forwarded-Encrypted: i=1; AJvYcCXxWOJ5J0ObxfxeZQDkFwsDOY9YxjKOvABxnUKQwmNdSUK7oemz9qv8OdwMG5r0sLQq4/qg+zvSbnzVi/Ztxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtnc/jCDYnE3MvWd+MFV6Y3Kh6ymKUOd9X/7n6W+2tsbRdabdH
	0lZFlkIwdD90edHaCbdHgD17yY5h2zJc/znp7HE5kZuOnXmQBO/C/Fm5ohsXgs4gYR4gNvuaAoE
	wnoz35Gkv5xeojD42lTyQpUDkssh8Op8vfqOyBt/tLpj040SSt0A78haN9S6vQTux1T9EmQ==
X-Gm-Gg: AY/fxX6hISZcy7F5H52yQvvd8iyIdpQ2FEnTxKF30u1FR+QTBgdA3Chfj6z6Bd5MpRR
	Wu8415ehvgy5Fc6J8TItD5CoqZKcm8IFAzradwQAqbwN1Uzcfp+tRrX7LVPTQqMDp0WmWz/gvWD
	iPADZZ45AjesdUG7hDL0MokkfvKBVdMXW7HhiL9MQNINQBO5rAccghJHyh5JtDNwGVT7NeqtVSO
	19XtkV+fpwSimvBUich9bIPzwAS95M37U8S0agpgS9PskXKX04GkAFHjhhkA91HzI/3Pt47C34c
	4EOLAUws8x5Fq7bMBW8/YXV8KX4CxyRecFbTFLWkBRf96aUzyzLpZvAZxE4Swfq92hp89sFQ9Qq
	QZYnYtZTLM/W7XgKpFE16IW+ueJD/M/6ENRP6qngPjsG83eNkzGDeH3C2y3OXV5dzVg==
X-Received: by 2002:a05:622a:87:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4f4abdfd1ecmr314602471cf.11.1767008905267;
        Mon, 29 Dec 2025 03:48:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1P2FyJAMSSx6XzaoQprEUStNYsVSCWjAZgWVJEifL21TGZpMhyQBU1RbwOWaNYz3+xX4sHQ==
X-Received: by 2002:a05:622a:87:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4f4abdfd1ecmr314602371cf.11.1767008904785;
        Mon, 29 Dec 2025 03:48:24 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad8577sm3297200666b.24.2025.12.29.03.48.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 03:48:24 -0800 (PST)
Message-ID: <7c13ed57-3ae8-4dbc-9ee8-472a84e2dc40@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:48:22 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: hamoa: Add the APSS watchdog
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-0-1801c55d2883@oss.qualcomm.com>
 <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-2-1801c55d2883@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-2-1801c55d2883@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEwOCBTYWx0ZWRfX+Uu8oZmcXRcC
 D9B2oYmruwzTG01K/GcUrX041NcP9Lu2nO3TiTl1bWwipjyPDA76Ad/w5QTnLc12sn9AAf2mgte
 y4MQhmGfihM178GuDV/g1khugxjHIN7jUR5U9pAKFRSoP15+IWxsE8ZPal1LBOdHh4S26FXPgyx
 4qHy4cvRoALSLiQTTc6x5yFMP5lRdMdBCjJqENXcJ8HXdwPm3MKQMixw4+qbnWzJBB0hwNfn1/Y
 Zg595D6enHLLnUySD3bii/LCVAjFI6gbV0Zwg6BIoY/8+iEtolUGMSezQEZaMw9KXQYrea25XyG
 LFgvOQ+h0YruCAHI58flkAWPor5yxLIzXqRc6IQ0yculyRlFbnezrXu4aXmPragd8Yqay7JGy9z
 LTrT7cbbtzoSKwJq1yRUeiNv0Hat/W2Z+tmXxMCvzLnN6pYR4FLzBpcwZuekIGP3BT72STeWYvv
 YoeFueodKo/9PFJDvYw==
X-Authority-Analysis: v=2.4 cv=VdP6/Vp9 c=1 sm=1 tr=0 ts=69526a8a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jtJCHLo7aIGmxyxyT8UA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: uEHAYsl9UbO6UWGAaLXDZTRdnLlIwaET
X-Proofpoint-ORIG-GUID: uEHAYsl9UbO6UWGAaLXDZTRdnLlIwaET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_03,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290108

On 12/24/25 11:45 AM, Abel Vesa wrote:
> The watchdog support in EL1 is SBSA compliant, handled by Gunyah
> hypervisor, but in EL2. the watchdog is an instance of the APSS WDT HW
> block, same as older platforms. So describe the APSS WDT node and mark
> it as reserved, as it will only be enabled in EL2 overlay.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

