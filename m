Return-Path: <linux-watchdog+bounces-4062-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EF6B33F08
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 Aug 2025 14:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69B59173951
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 Aug 2025 12:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571462EA166;
	Mon, 25 Aug 2025 12:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aADJZSdy"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B4F24503B
	for <linux-watchdog@vger.kernel.org>; Mon, 25 Aug 2025 12:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756123893; cv=none; b=HAsaEZuNOe+o51guATFLMZIxC8RF+sMzPDCJhWsbcjCscKPQjcMRGrQwiPARk1vQ+LHW4qrd6df63o6UqhDuibYHK7Zrh+VViw3jlg0JexRFJ3ywKfJZf294Pd43xx0Ndpx5fcgG72h8Bg0CvhyqtssbJEgDi+FFkJ3ugytKLjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756123893; c=relaxed/simple;
	bh=vLlamXWBSQHZZ9eA+LhLnoR7PU3S7eCIzBFd9n5LXu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ci8CS2VL2//EAAptO0349oXWRNXNiysoZfhjb5GPmcrjZADflBs5zJ3BPcVkkLqs2lf6orZzkQadGcxMf5XtP3uWyRIN63cJ7mJQIkHatAA6etp3Ow63kr3SuMgalRw74REjNVDP7HCHNUnkn7Zk/9wkwwHuuyuwQOx6ZW742rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aADJZSdy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8Tnsw026626
	for <linux-watchdog@vger.kernel.org>; Mon, 25 Aug 2025 12:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K7FbX2s1S4G/T5+nXuI9tHeqbBremko5yoicVgE1dm0=; b=aADJZSdyewjEcbpR
	8APYbLYYmxKu8hAklV8H6/dlFHPjgjuJLwsR7U64gf4WGjHRho+DrgAOvf0XKHsR
	p3vgT5K2ULIQypyMmxb6fAIl0Wr2txBP65kwFgq2l0VjuYDTJywR2o0ovJYd2Jj5
	4UyjBywzESyMFfS6j/ke9QtODvmwHi6cTNJPWw+s7k9A3JbeyAf1KTUj32hFUitk
	fkujqXvu6p5sJpzsFPgnH0z55Bcg/oJLDJ9Ztlj0dFNg+1Bs92OmHugOG7PKHILC
	D9r7I2XjKWmqWPFPDQ26MrglaZRHDT/fkQZkkC68kYt8PmySts3+UMW1pbjrX/Ym
	nWqosw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um52a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Mon, 25 Aug 2025 12:11:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3235e45b815so5115841a91.0
        for <linux-watchdog@vger.kernel.org>; Mon, 25 Aug 2025 05:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756123890; x=1756728690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7FbX2s1S4G/T5+nXuI9tHeqbBremko5yoicVgE1dm0=;
        b=GjBc3gJDio49TvaMb4OiEqwkkcfmRQOQOqPNqW4Tg+odzB+4yoX3LAYQq+sSaM+986
         3wfDrxSM0CIIuSM6NTamCjmzvDkfB/CKikcGfrv1w10EyGi73N8QrWMDDzvIPHmupsFL
         Ffq7u5GfTj/UoMvpAC9VBLr6wH0LSGON5GZR3u+KO7gP65jw7awNgc+Uw6AfUBdJo6mo
         V7KEOEVwTl6RWDHsBoIiEP9/xyb/jvEzGmaKnr5XaFflFsepawGcgCzWSOxRfiDki55K
         AUvIexiwBTOWfGDCy2ojehTz2TElTwu/l053nLTDsMDG1kZHCR15BB3He2SyIl+ml17B
         2Cuw==
X-Forwarded-Encrypted: i=1; AJvYcCWOqmdXkjqT5ayRb6OvTcmxPAKj0HYHVyRk62RPGVaSwePcoZSI50W0OysE9St5FiEKU6iKL1bR2d90uaTLOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3zfiG8wYskm+g25kIF24AJQCstENnisbrGrYw9injYhhvgl5P
	aE3l3x4Hkz18zn4N8mXhkkcfV9h05wllJo2eZ7PhPoi8SivWVWDiXXFqhVRXByUxGC4aQUJZmKN
	Wjskx88MZCkTGXRXvu+P+1GIEk6hdIqK9yRvRo8OT8zdpPsSz9tvr+igo9IYtxeYE+PzpaQ==
X-Gm-Gg: ASbGncu1h3rJddejVnO66gAj7aKCa+OIvZXG1wr2QYgVpA/U5cyu9D/mm+b49EV4krW
	K/hfpbNRk0i6D6kfZknG59KQTnMk1n49UBx4ztWgzlEAGQOvo9B4OyOFpDQQ4+kN+Upldg0VdUg
	abINhUV4y9f9LQkj1uRME9490HD868gfWYjfN11PIHanS+EAYBLPoKg+La3av4vlzcd0WK1VdZQ
	4kGEjUxc5+NjRjY9Wq9W3os1By/PzbRwZs/AIFxil3piR8gboWx8TgiPf8Rceh6/k7CW1gmRYNy
	DDKvd9AfM4UMg/2+hJFtrokj5U9J1H4OwFI4AB5IxHZcg+A8EqevLI8aIysvv/A2OptrTmrVAaO
	D1FNReso=
X-Received: by 2002:a17:90b:6cd:b0:325:941c:ccb0 with SMTP id 98e67ed59e1d1-325941cd8c0mr5253217a91.34.1756123890310;
        Mon, 25 Aug 2025 05:11:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFx8YCW4yGPKF6jpJ2B5L1bLxQQVF62NjexUICV5/Sy9Jos1/wYUBHlSFW4Imyg6eG8ezQ0Cw==
X-Received: by 2002:a17:90b:6cd:b0:325:941c:ccb0 with SMTP id 98e67ed59e1d1-325941cd8c0mr5253186a91.34.1756123889839;
        Mon, 25 Aug 2025 05:11:29 -0700 (PDT)
Received: from [192.168.1.4] ([122.164.82.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3254aa63da6sm7046778a91.20.2025.08.25.05.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 05:11:29 -0700 (PDT)
Message-ID: <f5069582-d245-491f-913f-7488227605da@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 17:41:23 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v3 0/4] Add support to read the restart reason
 from IMEM
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, bod.linux@nxsw.ie
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <175493766109.138281.3436384432329568509.b4-ty@kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <175493766109.138281.3436384432329568509.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ac52f3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=qL8JkhX1/0pBNNwer7kOkw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=cSn2wggv2xD2pGh0t4sA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX6OnEx+clL+Bb
 20+fBE6fNk5xXkj16As6Oqd5vsfl5OZF1fYGU8Jaqqk5yIVIYtCVzyWXHpHuDB7fF0fUmVAuyl+
 3M0mOFPdJrtFBhv0ehGJ26tlFFgCNloyEF8rIAhmOkYWIoPl4D1FU0mVc/JLf++YbDOr5StQjR3
 ce2uYMqJ8vF+pz3FhNkd2xBumMa8WcWTQvbrFaL+hUdX5p9o+xAyTsFt+tTYiL6taHD5cQAN+tZ
 QCTH8mCvDTUpJZjUoQXSa73lqgcLVCO6somW2dpOCr0ANQ1BjQUVUApagUqNKmsZHBYCraSa47W
 g6F513ukxJZGlet/4PvbuC6quLweG8aAAb8OITJ2lkh+zwBTwVTrFEb6CEcJEA6O6rl1dkskLU+
 dHU2V7TE
X-Proofpoint-GUID: t22anhW_PFJXtTQ34eitrgyCih56JaJe
X-Proofpoint-ORIG-GUID: t22anhW_PFJXtTQ34eitrgyCih56JaJe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032


On 8/12/2025 12:10 AM, Bjorn Andersson wrote:
> On Fri, 02 May 2025 18:47:48 +0530, Kathiravan Thirumoorthy wrote:
>> In Qualcomm IPQ SoC, if the system is rebooted due to the watchdog
>> timeout, there is no way to identify it. Current approach of checking
>> the EXPIRED_STATUS in WDT_STS is not working.
>>
>> To achieve this, if the system is rebooted due to watchdog timeout, the
>> information is captured in the IMEM by the bootloader (along with other
>> reason codes as well).
>>
>> [...]
> Applied, thanks!
>
> [1/4] dt-bindings: sram: qcom,imem: Document IPQ5424 compatible
>        commit: 3fa1095979393d5b178264cc1bdfb473e80ab774


Bjorn, IIUC, based on the discussion [1], moving forward we should 
describe the IMEM as "mmio-sram" rather than the "syscon" or 
"simple-mfd". So we need to drop this change from tree.

[1] 
https://lore.kernel.org/linux-arm-msm/e4c5ecc3-fd97-4b13-a057-bb1a3b7f9207@kernel.org/


>
> Best regards,

