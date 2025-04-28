Return-Path: <linux-watchdog+bounces-3393-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07263A9E6E1
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Apr 2025 06:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A64E1891543
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Apr 2025 04:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0B6199FAC;
	Mon, 28 Apr 2025 04:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FD13F1Za"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC715CB8
	for <linux-watchdog@vger.kernel.org>; Mon, 28 Apr 2025 04:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745812984; cv=none; b=DA+R09e9w3EeyNGlbhXKSbnIzCFuJbi4xi1mp5l+WrLEu/dWEZEyjEUaJvR1aubTmTbObdTaW+FqQ09fXcPNCyBKVl2X1i8KqcuT3CTLcNi2PPLbxY7RC9XRP5P1+djni4I4HyOuGg4peeLl9ElcheAkN4NUjPqF/etjX3QV9lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745812984; c=relaxed/simple;
	bh=KuJHWpeY9G7EH5a37ISOoAD4Y/0AlMWCzPCXSFKhE7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z6B4fuCNKGM7jHthfm81q3C7TYOFy6Mb72JrJdgSXQAGRGGpYdurox6htVWhADcrykM/ohLzqGw+oGVpRe/IdRfMzpmGdwknzGCgeWh/9KtEGbAdmhXU/DpM6CjdkkCqRcExFQoI59K4CndiqQxETKXoM03sRoss+QUBIzXBKgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FD13F1Za; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53RNMeIT006372
	for <linux-watchdog@vger.kernel.org>; Mon, 28 Apr 2025 04:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K0PDgBD8G9dppu53mDcg17WnAnpR4gSxGNEHlYxbcv4=; b=FD13F1ZajFkhKu+l
	/JwkRM/yQFhGKXz9U2GC+3PrEO069Dgh9NmfNjMWaZkZ1g2daNkJPaa22+fa606u
	O9CL2tq/Eid9xMERLzc/dFJIFY0WMMhWRRa/GYscoZcABtmKyNQ/ydo4LtXzb98N
	pVTbOc6PQTbaY8nV4RzUptont9WUhLZmT4wiw5HhVVfzTqcSLyeF/IKaxtauWftO
	xGJwmRGS2tIgxlMMex30bQU6WNk5HSUwnOQbgNjwswj4VbYgy6bnzjV4KoE4PS+Q
	6tCTeq2PpxP2BQgvzcD1nHWoVbqt42nlD32LdKbupaYulOU8Kp+fjlS0HITp46ZL
	zKIK+Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pevdvjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Mon, 28 Apr 2025 04:03:01 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-739764217ecso3713296b3a.0
        for <linux-watchdog@vger.kernel.org>; Sun, 27 Apr 2025 21:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745812981; x=1746417781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K0PDgBD8G9dppu53mDcg17WnAnpR4gSxGNEHlYxbcv4=;
        b=uGb9QdGsLthxqBaT+30RAGyNb/KPbkZr5jjbVIFjWrOlvNuP1+4XEfO+5lb0q1G5/b
         2SodrD1eNiTwKGqgg270G60XT44VLfu4o6slVpwaCCQXooIMNrQAnRUburExcPU5gVEY
         6upk0ZtpN+EEPSXPel0t03GZhb6NI8tWAjDy9u4IRkHJ+OBCL+D+mEu+SzguQ4mihzcm
         Crp5MibJUSn8PQK3ehusH4mMEV3uT63WxbjCezJwehofeG0xfx29ZeDa1RICW3QOUCnK
         GdNtXqcycInXE0DXSLZlacjCY/9u/GBz8rLr2mJ1Op5+No92JHfQ8NGKq6ZHQpy7qWHE
         dQPA==
X-Forwarded-Encrypted: i=1; AJvYcCUY10N8GDycxLlQhgvknEVgS2O8j+pkZbedoGaLLxmGt8SdgcCpYfPmGbNoU3oY6w1soe8XWpuf42fAeFPNdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc1Hw776zTW/QIMfet+zifJ7nvpis+ayVCdCx4PmOF1EC1h+K/
	zJG+y2G+/PEQ6qAi7IgsrejyL3qFZrx0yf8fhsIl6qCuQikM3B1UIRKg/rq9wwkVOoVcZ0bJX99
	pYTCejLIIx2ue0ZujS9UbUqk97Iyx3GeT7OrE0Ns/w9g2bIM9XIW5L0M8Wq7aMopPWTX/Tw7V1Q
	==
X-Gm-Gg: ASbGncu21/kM6N88De8QF0FUr2Bcq2iKLFjQy1/dLnwMz/bT04G8mU6pWLlUMxojr+Y
	r9w7ToCNeNfcgLRvEJFIxWHz9YpXY2uVpfMzscs4ECQYlg+TMQI4ylloI5nolWzHfEYP5190ThE
	0jEuqIxSiK5yRcmQr54zDgpT4+hSdlx7FfjJy04xYovVRpIw4eucceGzTgdtTjXAtP3COfUcr/F
	nELL8c/UJTRx/HPWonNqvFwUWrM4tPPhotcRrQO+cOnx9V4gpAC7nONPnWIlpgkojwggCqjaR4q
	VJUR0ViYTrI1neF/kbj5KKeODmA4Pyrib3VLUo+wHGKUvugqvNMJ
X-Received: by 2002:a05:6a00:4483:b0:740:6f6:7338 with SMTP id d2e1a72fcca58-74006f67497mr7693663b3a.3.1745812980809;
        Sun, 27 Apr 2025 21:03:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1hf0kv2RwwAEJN313Le4e9anZymJSkpiF666mSWsbq84QqRggU43VATQtdXpKlPpzwfqg/g==
X-Received: by 2002:a05:6a00:4483:b0:740:6f6:7338 with SMTP id d2e1a72fcca58-74006f67497mr7693629b3a.3.1745812980441;
        Sun, 27 Apr 2025 21:03:00 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a3casm7181186b3a.96.2025.04.27.21.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 21:02:59 -0700 (PDT)
Message-ID: <cd915cbb-13f3-4c08-a0a4-6f9e23701463@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 09:32:55 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] dt-bindings: watchdog: separate out the IPQ5424
 compatilble
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com>
 <20250416-wdt_reset_reason-v2-3-c65bba312914@oss.qualcomm.com>
 <20250421194306.GA2648051-robh@kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20250421194306.GA2648051-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oNzwbR-1Ye14OvKXR4WLzWkBXmFMkQ5-
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=680efdf6 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=7JOJDKANAUoOSfc3MQoA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: oNzwbR-1Ye14OvKXR4WLzWkBXmFMkQ5-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDAzMiBTYWx0ZWRfXwi3oWKeirnov 4xgLxQXOBRSTL5QTQEPjn96z8msKXwpnYCtyltXfmcVajjr54RQn6NBso+1QeSEG0oOzCKLZ3xW YPWoi/RCtYrBvqL0NnqHTisjeJRvrLTnow8PvoRYWajkwpTvVJFqz33YmOwxfdeETnDspNTlBZS
 kauP0asNFluDkeGYsOC/vV4YrTNCgI32I1rKKPQvLL4M66fImC08YKoN+hf5LgTaSURGa1EsOZ7 YOqqttP2/dDVo7xA92tkPipNYT6y5U1EXpe59YouQUEsJYrIML6J2j506jkxQZSOTVDq1fYMCol 7BNCG1NKwSxhV6h23J0gXg3xZYS1msRDfSMuQvDwrauj5iWmZxOGIgA5GFPZddfx+T/sghpu34w
 DVbgp6KRrBRWVYaf9wuoua9j5q/+74DWrh9xaL+4M1y9vYfOz/y4hXl2pwPxPnQbkLnzF56p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=922 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280032


On 4/22/2025 1:13 AM, Rob Herring wrote:
> On Wed, Apr 16, 2025 at 01:59:20PM +0530, Kathiravan Thirumoorthy wrote:
>> To retrieve the system restart reason code from IMEM, need to define the
>> certain device specific data. To achieve that, decouple the IPQ5424
>> compatible from the existing list and define along with 'qcom,kpss-wdt'.
> You have missed the whole point of why there's both a specific
> compatible and a fallback. The specific one existed for a case like this
> where you need to start distinguishing the specific device. In short,
> this binding and dts changes are not needed at all, only the driver
> change is needed. Then you maintain forwards and backwards
> compatibility.

Yeah, I completely missed that. Thanks for pointing out. Will drop this 
and the DTS patch in the next spin.

Thanks,

Kathiravan T.


