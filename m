Return-Path: <linux-watchdog+bounces-3264-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB18A82F3F
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Apr 2025 20:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A9D64448A2
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Apr 2025 18:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357A7269B1E;
	Wed,  9 Apr 2025 18:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tg+0WnMF"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E022066DE
	for <linux-watchdog@vger.kernel.org>; Wed,  9 Apr 2025 18:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224582; cv=none; b=pvg4IUt93WT0STUUGl97Afkxdd7Rn3KCkHjSUXvbiOAKHCqYKgU1+la4QkugwJ5SBoHGG6D8jL+HkDTHm4T79OLFTPo+wgIrm6KZTI//GbPI9aoZBVyNRpXAwXE7KnsWr6YaykYOLfSt5mivdGGjtsYXYZ8wx3LrjHJLcyuh61M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224582; c=relaxed/simple;
	bh=d1HN9Tr6UusnWUDY09EuhHWuXvJFMZU/PC1RTqx388Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RGhcakwGfCib+Tp83ehmuGwWEeewxKT3ltctoeRTClW9nbAp0qbNFHSoeZrGpqVyxTBsBghuNQvnMXlZ1EYMGFUdPqKyQVcI+ZJiHhzQUpVWnefLomt2AdySfC1DFAZCW9et/EWjIt7RpKYIwLa6G+sb3aSdXFMN8j1NSXHxa58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tg+0WnMF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HDOHS004582
	for <linux-watchdog@vger.kernel.org>; Wed, 9 Apr 2025 18:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9G1H4peKA3lpmZuEmoeg3zh5n+oBKM3YHIRLcwt6Bh4=; b=Tg+0WnMFbMdwmdAe
	jGAgLCxebue2pQoTHclz7XGlGQ2+BfZjw6B2C6PYKO6E75IOcmHWvybq1HGmJZz/
	8/WKj/sCbOT32dP+eiLNs16mUaE7A85D3H/wH3o5wtr/a2kXlAYAlKWqmSbEJ/j5
	k/i1DOM9PBnkotkmb9LYrtBhtjYx+YoZBepNGFQcGXfCxKIkMddC1O9unS8u/MW4
	xtNZnyV0Wx1yuoclavN6npAop8c5H07iRhdh6CBcqLmO1P0TAidcHuFTF1UrVJXt
	8pY9UnDzK1S1qzUo5dMMlOHqK+KrqirG6aawVI0P56DXG1/V8mWeMoQAdJ+FC8EG
	Obp2Vw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb4j2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 09 Apr 2025 18:49:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4767ca7a333so14528531cf.3
        for <linux-watchdog@vger.kernel.org>; Wed, 09 Apr 2025 11:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224578; x=1744829378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9G1H4peKA3lpmZuEmoeg3zh5n+oBKM3YHIRLcwt6Bh4=;
        b=OZ+8MGym3Uj10XLpZxw/Of6OWLJ8dZ0vcs9VUwrKqFeFejZApU2LOMS6jNMx+jn8pF
         0w4X7rbwfa7htMueZc7xjh5Lwa924YouKevH16pPranADm9cgeXybpt3JuC068B12pvd
         ZPw7j6k+TcgY5pYbfvS2SooSPuurhShf06n4+kW1yspRm9qqUT4JCx4FT6bxoFDM1THy
         lLzJTICX9eK3tZ/GFC/RSv3UQcVcBjMBkwjC1RzKgAJtVVDK3Tol6oooaLnHUr3/MN0p
         iZQUV2dyzQS10orYSNWaH1GFN6pAXnOZ7XjuWAy26pDDzhhyFbWldjoTx3zEwTzYmkJU
         fUpg==
X-Forwarded-Encrypted: i=1; AJvYcCV0uE28sV5cUe+rw0WfzNSqfag81b6G1ugJOAZpt/x35uOvxJl4DqlhHVDVHfi2Kw6lf3hkIjyj/0Mf2RIJUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmvQ9Ymnv9QVS7ZCyq8ZbViXxj2djxLKtR+iaP5SIjK0oKVYvv
	n/6MwiOsGkdcZQU46yJKKEqhbYyKZcjW3V3PgGgPlPe7LJJGmlaYmIdHVXu0Ap3Hqf5n3u/9K9k
	dUwTescoCKP52LX4QiV2LNr1f+3Fk8l3yXMYusPIdCvvmgrtYystdtVHbpDCf/2xDLA==
X-Gm-Gg: ASbGncteduabDTUHyqpHS3tId0yi3cNAQAZoySMAOOX3F0vvEsFMW2GU6UCxSu9dn4w
	pLbarSHyutM7W/aLirp/SlgAjI3KECJgdh0eN0Azr8LCx/OYR7IZCSTU7BYsnhYeuc2NpXFDEPS
	MmJRzhauDPxe2MqR6OCoI+wA4ZP9zSLe7O6XCuUTGEWJGg3MPo8EI9CWXl3aUVzp4v6bXfrAwX8
	AJF1flHvV4CRcA6413k0kge2XqqgZxrnqSIiMQsTgauic/nLB+k4XGXuPSB8vGknMMeXn+q+j/k
	Y7tBHX2p7jolOkj6gUtm2pSYqufr3BSfX7nu4Aoia06yrxNhyrcil4H6ZE0gvJsphw==
X-Received: by 2002:ac8:5a85:0:b0:472:1812:23da with SMTP id d75a77b69052e-4795f37eb0fmr18667051cf.11.1744224578477;
        Wed, 09 Apr 2025 11:49:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4IsBpqmt+cYnKoIaMat7rtolFSfys581Xta6Gs0Qhv7H57/HFppjF3Hi21BAzmpJ//NIfkQ==
X-Received: by 2002:ac8:5a85:0:b0:472:1812:23da with SMTP id d75a77b69052e-4795f37eb0fmr18666801cf.11.1744224578139;
        Wed, 09 Apr 2025 11:49:38 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f2fbc0d2d9sm1138649a12.29.2025.04.09.11.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 11:49:37 -0700 (PDT)
Message-ID: <07426a13-7897-4fe8-bfc4-549730717e85@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 20:49:36 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/6] Add support to read the restart reason from IMEM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9ZEPz4FtpMPljgEMqW69bFSHqvEb73mv
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f6c143 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=5K-QkYO3ZFZSxnrS5XMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 9ZEPz4FtpMPljgEMqW69bFSHqvEb73mv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=810 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090124

On 4/8/25 10:49 AM, Kathiravan Thirumoorthy wrote:
> In Qualcomm IPQ SoC, if the system is rebooted due to the watchdog
> timeout, there is no way to identify it. Current approach of checking
> the EXPIRED_STATUS in WDT_STS is not working.
> 
> To achieve this, if the system is rebooted due to watchdog timeout, the
> information is captured in the IMEM by the bootloader (along with other
> reason codes as well).
> 
> This series attempts to address this by adding the support to read the
> IMEM and populate the information via bootstatus sysfs file. As of now,
> we are handling only the non secure watchdog timeout reason.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

So I think it would be easier to model this as nvram (something like
"nvmem-rmem" with imem perhaps modeled as "mmio-sram") and then consume
that value through in-kernel APIs (or write to it, as necessary)

Taking a quick look at mobile, it seems like "reboot bootloader" and
friends use a similar mechanism

Konrad


