Return-Path: <linux-watchdog+bounces-3283-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFA1A852CD
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Apr 2025 06:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 980204A261C
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Apr 2025 04:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90CB27CB2B;
	Fri, 11 Apr 2025 04:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iWmqHDI+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F3D27C873
	for <linux-watchdog@vger.kernel.org>; Fri, 11 Apr 2025 04:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744347435; cv=none; b=N/n+b/m4fRoGnMNcth27faysTNo9lNFni5gRvJMv24zkqbLNQcKHmq6z5FMZaccmjMoG+QJm8ymaDBPHsEZon4ZjTIZXDeJ8sI0+GolPR+TUmR1QhYUtJEgvSL751avr8iXWmkuJ9ZEepRRbgyJPCv9RwqasopOAUBNtEUJCs1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744347435; c=relaxed/simple;
	bh=JpzvRlWnvMTnv0Na6kig8hXzwQbUMyigmXeiJ0MuG+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pjdW4Asm7E5M5lDLFdxq/OieC8Zb1XPO+dVG0WKq5UGiDS6kzXs1bRzrct3B4xouI08Jn4b1DErIRetLCmFiKzDHtA7shBqfT8JOeBmtJ+7yZKUM07QtQ3pAG/GoIxFeK73J/DS81y6r2aWDizk43128zcKRswIZssTSB5q1WLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iWmqHDI+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B1021Y001379
	for <linux-watchdog@vger.kernel.org>; Fri, 11 Apr 2025 04:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NHoNWOHKFoshFaehq3UAL9DcaVSVzxtCgS68zrHmy+U=; b=iWmqHDI+XqMQwe4v
	9CbIIBiWLCwMLdpvQLEBudV0YkG7FD7tlCKAZFjpm0c7gMOLkeUgoewfEa6pn2SG
	RiQaGuiUz9EbzTTjI/yFNxRi03Rj5egczyBJN0MDC0JmVp1nKssq1uuyrkzRAjp8
	j3fLoAPdGXnHG5eoUVBdjjLXLJfQCRo8hDNFcdIxC0ge9K6BRjzi59vh3Ibg5dNR
	IHwpQaWfx1EdXfOOk1Y6LUiG6DnOcmGHSlKMeOMdSLNwzFa8ZmvsEMZ/Yjz8XyWx
	LOJIz5U8olJkBY8qh3HRFoM7BhwU1/vRtQugKRyoLW5Vzxjt6QifvrkYhm1n7YcV
	MezMjA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfts03n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 11 Apr 2025 04:57:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-224192ff68bso14896805ad.1
        for <linux-watchdog@vger.kernel.org>; Thu, 10 Apr 2025 21:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744347432; x=1744952232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NHoNWOHKFoshFaehq3UAL9DcaVSVzxtCgS68zrHmy+U=;
        b=RPZfo3j6R7q5997TQVMQFixFaUmPDlm0dYCBW2rBrV72qCas0PtQz6qUhm2V+tJDO8
         m11x4aBm99PB2D5DlOG0ArGo4Dl0t+1ylw6xkMnmE+KBnYAlJ9beJaUtLgm8a3hekky5
         gLB7I0P5aAR9tZRnp5+YYNUGzm2BWL7sWptornOHhvzb5HAajz6FMNDSxyh2jI4154w6
         vR//UpmzPMIndHrIU0xzS141zPy7QvQEEo42OlwQLVqMEHYiDF50hFZACN3t+FdihEaO
         fKdjAxqt/UqEdtV+3vik0Svdh8jqo5cP43JzSx1GXMcEpwr2ENUp1Hk7aJoxUfW3xifF
         1muQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9/mmWKiuy9WRBHmur3Pd17NmeJrNFqMKI1L4vI9/4+czeFKZcrxSz9oyAW9ZTuh1H5jPeMOhbdz0yHyOlGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUZ+/9BgT2TnAPwdnezc/INC3S/3f9os9qMGYEMIqFzuuWrM8C
	nwKjUOVRQsLrkECRJnO6tbVonfeaFpSDFOloR8FCb4IPnVLjnrzGl4YfekBN0BX9kIjEwD47iDg
	Ahcv6TLCfHd9C3SeKk3ikcxLmkeSnDmHotD4Gm1AFG/OhPqucLQBNgajrhryB0xfExg==
X-Gm-Gg: ASbGncv91zWZQMRQzZKUCCl7mbY4kXpIFFBPDaRCSKJkmS3/TuOOBvKV09povBtVsnA
	jdUb61+GuHBnUrCYmvJTb8jBa5IWbuY9vr3aKfDgxcRfu5eLeSorEsVxijI4Q/NPN9of9SQLSJ4
	9lXkRuvZGnvgqndNMQ5Bii+3U0DpHBHOtMyFnZm1IWW5ymF6iyjgbAu801KIKbqSrDeiFmJ4NZx
	GWIW2oyRlR3tLHTYVh4oXCZ5hXWgJRye7OLA9MMKey2K9V/ILv0EjvwNMVlMWg5tbofxPeXpE/Y
	mBlp1yuK5ox6TrBa0Zn/DVY6BHvJzvY5ImTui1j60SccOxDt4BFi
X-Received: by 2002:a17:902:e886:b0:223:58ff:c722 with SMTP id d9443c01a7336-22bea4bd841mr23399085ad.28.1744347432343;
        Thu, 10 Apr 2025 21:57:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3LVdho25KSR2dWoakhkg5dqqnrfpvHUoqN63RdHfjyjqEglVC0+177bf6Ti3GXNg+PAlyWA==
X-Received: by 2002:a17:902:e886:b0:223:58ff:c722 with SMTP id d9443c01a7336-22bea4bd841mr23398735ad.28.1744347431910;
        Thu, 10 Apr 2025 21:57:11 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8c62dsm40005325ad.95.2025.04.10.21.57.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 21:57:11 -0700 (PDT)
Message-ID: <bf5f3517-13fa-4e8f-a22b-02be383a9148@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 10:27:06 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/6] dt-bindings: sram: qcom,imem: Document IPQ5424
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
 <20250408-wdt_reset_reason-v1-1-e6ec30c2c926@oss.qualcomm.com>
 <43dd7191-c797-4d8c-af58-03fc0eaaa95b@kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <43dd7191-c797-4d8c-af58-03fc0eaaa95b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f8a129 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=gjhQkaFbtYs2ieCruLIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 8N691oJpRRKkMrSD02FoyT89aEHn_g9G
X-Proofpoint-ORIG-GUID: 8N691oJpRRKkMrSD02FoyT89aEHn_g9G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=826
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110034


On 4/9/2025 12:28 PM, Krzysztof Kozlowski wrote:
> On 08/04/2025 10:49, Kathiravan Thirumoorthy wrote:
>> Add compatible for Qualcomm's IPQ5424 IMEM.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
>>   1 file changed, 1 insertion(+)
> Why is this RFC? What is not finished here? I could not find explanation
> in cover letter.


I added the IMEM node to retrieve the restart reason which is used in 
this series. Since I wasn't sure about the idea which is followed here, 
I made the whole series as RFC. Going forward, I shall explain why the 
series is made as RFC in cover letter.

With respect to this patch, nothing is pending. I can separate out the 
dt-binding and DTS for IMEM from this series and post it. Please let me 
know.


>
> Best regards,
> Krzysztof

