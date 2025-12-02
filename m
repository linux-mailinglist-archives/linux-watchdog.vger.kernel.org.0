Return-Path: <linux-watchdog+bounces-4650-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 96602C9B4DF
	for <lists+linux-watchdog@lfdr.de>; Tue, 02 Dec 2025 12:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 192C1347667
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Dec 2025 11:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EEC930FC39;
	Tue,  2 Dec 2025 11:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K1vdQ1eM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AMZcI2JK"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E790030F54C
	for <linux-watchdog@vger.kernel.org>; Tue,  2 Dec 2025 11:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764674642; cv=none; b=AyySIG32dnwfbIqk9cq4mUbYSFGe7/N5GIlhGe/7tZ1tKwX+L5hhFPY9u89McfF/YpTYNqH6YhCW9weTXzSb9QBkZO/UbF4/qblnnw3q4zb9wGb7ErwhGANPWErKJuSLvACv5XZPqJNU7Qk5W+R5IAuUYaKivihIfl1AZi1QhOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764674642; c=relaxed/simple;
	bh=Ur35kC7ex1LlDAxoSgVabazTIjVWHELziTdwUeDTtwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJGMxcpkJovqrJZK3QHTghCdSYWQt9AE91wJDeE5KlzFbVjRULyQWuuN+2tVfo7o4eIh/w6KRgLnZapGw1b2YkD6K7fXwWoPtCLWiH3W4x2mzUV/ZOGJIEj5dgU+J8cvDyoeWVMzAqRaFx6+Ji+fmqsgGZDLimEonhJSnInRgv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K1vdQ1eM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMZcI2JK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B28N48l3284557
	for <linux-watchdog@vger.kernel.org>; Tue, 2 Dec 2025 11:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BP+WE8Qo8est+P0uDoDlZmZ7Zwtd1KdJqw/NEEpJeFY=; b=K1vdQ1eMbnjh2Zl2
	4KEhF1uOFTXeGoD3W/Jokzc+pR4tW9Qwo0Ltk/BzilHMU9N9BX0VaXooOdihQa6u
	Kzlw8sP32n4Yn1+LIEuyMmcTgzxjVdmZVy+5HoIx9B/zadcwa9hVDO3zN6cy1GWm
	BkGMIiEnn45rHmX293tiU5KxUmBUkdllZRJP7ADK3d8ryPvF59jM0A7/4bcuq/+v
	4MtU4Qbov8BNqxug8JlrJqb5z/yTUWmcJnaOI+cwZnieAct3I95c4WMaeekZZJK1
	xlwuQ8kVd2fIfLMb65U1dksS6yyVVi6NGvBlC+JR9bK//5Ve0xW5TYYEndc/Agvp
	oQWp1Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asvj90jjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 02 Dec 2025 11:23:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297dde580c8so138858585ad.1
        for <linux-watchdog@vger.kernel.org>; Tue, 02 Dec 2025 03:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764674639; x=1765279439; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BP+WE8Qo8est+P0uDoDlZmZ7Zwtd1KdJqw/NEEpJeFY=;
        b=AMZcI2JK8cnQHHQXfVytr9ZD9c73QqOeQSEDJ+4IMQIS+Muf2gq0FBO/NRiTlhgiEa
         ZZvqgF5f67Bd50hZCeL7v/XjUkTLq8rQ7X9KQROFyu6FR0p0eznRUnZYRGBvpFxUjWTj
         K3Q5nHKdgCnwxBM3bmAZrEh0cAOdvSVe8kG5qyPo4RAMpnrkijuycBkMcygijwY2BA6s
         /UqQhIDv9S4WwA37LBxILEB0W4ZFYQw8N0s6wIxEe9E45YRW9Bda58UXuKMfJhru6Kq4
         yo6ttK1nb8HVQeFM6M3M1dLZCrxWxRrWnU6rMqe771UIXHwvrCOoRY+h3llKwmcEwnKy
         pP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764674639; x=1765279439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BP+WE8Qo8est+P0uDoDlZmZ7Zwtd1KdJqw/NEEpJeFY=;
        b=qlFctwj7+YhjNsg9qOTsUrJwX0iJ1Oi7QCCzn8nxxEMgUn6WRD90KO3KuV3xfqzAVN
         wdsupiM9R59/i71KHbbEPfqy4d4K3/12FZDrz1Y3huLRU6bOmUms/GIv8YvEOm/OUyf8
         JQ2rDG8zJVCAbrGSGVKj5h10DkwjjaNmXPIljllnm6PpEdLCeBbtqbNTX+i1aV1ceTpt
         Wq3OKp6WY29h73QqfyIflMV6CbKHyyMRgwtFoz6jveRXDSAinQtJ7zvXFgaYraCb2LTq
         8xrHKWcX62Tm+fD2iCcqi0MynNf2fyyMNQ9rfIyVsNJpLPmeRIHPOLlhDGifzQuw0JEP
         yJFw==
X-Forwarded-Encrypted: i=1; AJvYcCWZDASWbq43rnQqwuRjyk06c0T1hGHfUpmELr0RryeCQ5PY/xvJkzem5arpFvp3W+IioV2Vqd+BtcEedi+g3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbezBlSFyUrWy1smdJ48qgG6J9YvNnrkKajmjUJ84G4jlm4bW1
	GlR3/Hpm2gf3FOYIJoUonRzSHbrzP86T5rJ75UF/KyhbxaxejqcZqc9dGAl0VaS7WshuyJ3vCtb
	38E6gwuRRGm2VTXSoPsCiSFNQxL3gywfR3N6ieY5g4lzQi6Sv2fjnzhRGHabhvkBLHOOdgA==
X-Gm-Gg: ASbGncuRuwiEcy0L4dJfE1Xj/JfCkCn7Iw3YAFGUy+iiwJ/SABL2d/qI5ZZmRxeBrxM
	mqrOuzhcfZ5FLU/z1v7BL6DVqlD0bl6If4NkCFKZA0Qf3aWg1DEzz1PmrvHVcWgPSRwKtlYhcDz
	jZ9SiBxrHOAT7e5DP4YoeAMtXEduDVI4MaSs/d9q/f3yxDHgol1vPoJ/H+kAhdnopZlPWFPjRlo
	ifcqtNhgh5A8DTROC7AIbg2E4ttrX3bwDRgpngEB8Ani9/XXHEhFKtAnTRDup5mf2VBv7PMwb7V
	pFmSD2CvDxIzp39Qwxkcg85z5onkdkcvGM66qkha771SKv0+aqRre9L8LuQyy3Kb3c/7h/OyaCI
	q06vQLcIVvj8sCk/xAiXoNtvouhWJP8/sBRgP7zIShQIEXUg46kReudWyMXU2ossxd1CoJrddKk
	pEIwfmMQER7FhEaFO8e73p5hRhSsrOMj3t
X-Received: by 2002:a17:902:db0e:b0:295:3d5d:fe37 with SMTP id d9443c01a7336-29bab198021mr312051545ad.41.1764674638530;
        Tue, 02 Dec 2025 03:23:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkTyb2UgaQNFXC0mQ+wVAuD2Q2MIZoOIJIXSBk6SLZyZ2ecRicxhzG8Pw9QeVrE5MtSZbhMg==
X-Received: by 2002:a17:902:db0e:b0:295:3d5d:fe37 with SMTP id d9443c01a7336-29bab198021mr312051275ad.41.1764674638070;
        Tue, 02 Dec 2025 03:23:58 -0800 (PST)
Received: from [10.190.211.199] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce477e94sm150184345ad.43.2025.12.02.03.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 03:23:57 -0800 (PST)
Message-ID: <6a8f5d62-f6ea-44b3-9baf-acfbc1e58efe@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 16:53:52 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/2] Add support for Gunyah Watchdog
To: Bjorn Andersson <andersson@kernel.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20251118-gunyah_watchdog-v8-0-e5de12e2eef5@oss.qualcomm.com>
Content-Language: en-US
From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
In-Reply-To: <20251118-gunyah_watchdog-v8-0-e5de12e2eef5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qWowO0CK2_noWivTl7iuJ1CjMRWdjsox
X-Authority-Analysis: v=2.4 cv=Hq572kTS c=1 sm=1 tr=0 ts=692ecc4f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=BFnnhZRdYZWPRrPjbyQA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: qWowO0CK2_noWivTl7iuJ1CjMRWdjsox
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA5MSBTYWx0ZWRfX3OcsoZIXfYsT
 1AhocB5mftq4ieA92Q2QbalLy2/y1BZSt34FiGV8M/48RAI7h1dpbZ78w3JkU0kMcj76De8Yl71
 rBMsvhZ+V4iABjz40Sp3ySbTnI8+ujklwZgn452Ba568+Z3ZW84hjZzFsnxyL6dnhRnnBLeEIzG
 oVzwdT+ukBnOFwUqf/9y0LhupHUcAGfHea8mTa2zH7Cr2XeH6pbEyqg3sNXCnSHvTc6wq7t1gRt
 MdUIKMDVJXJinbKKWOjAwZxOBc/9LpiKEzgcv3PzTtt/yvkVYKkD7cZk6BhNGCqCjeH2aPklwsT
 m286I18SOnsJ3GHpMl/GQ8DXdl6d0u1OgVe1Kc+j2p3Q3nCtL3S3zLdK1MKXTkHd0pw/t4Dc5n1
 2jWtxFxWNuAe8VkWAqnHOqXJjx9xTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020091

Hi Bjorn, Guenter, and Wim,

Just a gentle ping on this series.

Since the patches have received Reviewed-by tags from Dmitry and 
Guenter, I wanted to confirm the merge strategy.

Bjorn: Are you planning to pick the QCOM SCM changes separately through 
your tree, or would you prefer the whole series go through the Watchdog 
tree?
If the latter, do we need an explicit Acked-by from you for QCOM SCM patch?

Thanks,
Hrishabh


