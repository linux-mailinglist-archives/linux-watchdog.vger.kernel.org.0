Return-Path: <linux-watchdog+bounces-5006-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OG57KYB5oWkUtgQAu9opvQ
	(envelope-from <linux-watchdog+bounces-5006-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 12:01:20 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8080C1B650A
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 12:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3ABE30859DF
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 11:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2083ED113;
	Fri, 27 Feb 2026 11:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FKzhRSGc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TJ6swG0Z"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4DB2459E7
	for <linux-watchdog@vger.kernel.org>; Fri, 27 Feb 2026 11:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772190065; cv=none; b=Lp5BFlINF38Xdlm+bBVvn+sFXPckEugKUO0ItEr4WNfWUMDE87MA9tfr6kwDiL/zvbTxWeOKO8wDMKeYIWUgqDeR7kcrqPIeFxNCXSnYG6nCWEeW91/EjQANSjHVa7xflSdeGIVCUd3Ck/LiREkO7Y9O6ZT+wG0Ja2NwAXqS9GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772190065; c=relaxed/simple;
	bh=nnX1dfVHGU3BUR2MYHa/QsBvwb2HUZkPfqijX40+JF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U12U1M3TON7v321DYnQ+ITeFr7zqwVbNh+HSkW8OKF8bQ3Aff0DCVH6Xcz4huH/7lbWOnhNMgqsWG796bQvad5SQzMQshzhAUmSSliDGcLuiXIA1jXfcfvAwy7KRxQtzwaxOlm8ES8b98sxtSL68PqAxxEDLnqfThRBV+jfXHmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FKzhRSGc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TJ6swG0Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R9pwJq1601204
	for <linux-watchdog@vger.kernel.org>; Fri, 27 Feb 2026 11:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NCtcr010Ca6Gw1uJ4Xsw+K8f8kTmPEsbbllDwvyZmrw=; b=FKzhRSGcvDDkopHH
	BBa8VqbotoYuR/3p90F/b3+byUHjoXh4BGw21AU8JPOmXWbqF+7MWgv1xxWKf5ur
	XpRPVw2H0LeSjMqn1qESZSLUf0AWiYKXGaL91AS6W4FUksJZvms35/yWL4M6b7kg
	dFNNwYc0zvJKI3ytqU4kdqMdT9Kr12efj1GmEFnfeK/KJ2HWONLRzpSikrmadt88
	oi3eKW+WDgT5ECAbUcYXZAayCL5uhNgCks7MLJXbrvQpKlouvSTvzidIC4Xi9fHL
	pxagNrvrcS6YdjkJ4WqQIOvHxs7gwz0XPng9dHoQdtc0zvQoB2i/AFr5/pJtZ0Q1
	AmmcZg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt99u9ep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 27 Feb 2026 11:01:02 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5fdf3c935acso468690137.3
        for <linux-watchdog@vger.kernel.org>; Fri, 27 Feb 2026 03:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772190061; x=1772794861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NCtcr010Ca6Gw1uJ4Xsw+K8f8kTmPEsbbllDwvyZmrw=;
        b=TJ6swG0ZIGC8AJqS1xthF6jV9+sa0j2jXGpCUN/Yx9kVRYgkkow1sFmdPmJ1o060u0
         ERH4EfI1/g53otPU9cvp4UOJxctxfxhltLgChzzo1NfdOSmxErxlcoH8OJEzaI61NdZq
         FXst5c874VaQTiR5rsbh4bQWmH74JRi+616fhdaeB4JRuWo0F4v/1Gq7/8iX5FsfsZ59
         ivcJFxD3KepfbOPH8YwDwDT/UIvafLy5PL+B13UTdidMA6ye8CXlSqtmoA9636sePMwX
         go3KhtgDaU7V8FUVcoZoPZUtzkPmDIfacJAFGYH0BMIKJm7w2lPbhYoTXeiVoKKiSlHo
         SPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772190061; x=1772794861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCtcr010Ca6Gw1uJ4Xsw+K8f8kTmPEsbbllDwvyZmrw=;
        b=j9eQRVYYH86lVfvBXKCGJ+IrqkOPvrgVKUvBZbXvuj58YmlSo5UF0dwz+0j2P30eAe
         hc/bGxKAfTtBim9dhkiIR+64ZD/pvEy/L1MBpaZ3DeyThNLzfZ88ZwXt8knZoEce8Krk
         TNe1RQ3R5veFwJoGSLXgESVJgZ2+heFQobIWq4ArAxR8+FGcD7x4E+5tkDiwqBraop7z
         RnessQzAcfwNBKlkhXGcB0nJ+mtDsXfiE/HL5rjtt3n5RxhhFLgFLxyk5uJaawZri6/z
         19x2g1z5eWZgkboHUkaZmkoeO4xW5+wBgxEpv838llpkr8740/Q148W1bemTaUfQxAQD
         q4tg==
X-Forwarded-Encrypted: i=1; AJvYcCWCFZhNHGm9QBnYOJ++po4hCmgXkD++ajPN0TIv2MDW6KWApWCEhqWKliqGhUikgVdLU0MV5lGaNsNf3yOyuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvyfRdAH9cxuQvsbuywr8An0pFh3mmmQBK2xClJ8cBwdeZ40um
	RtGtoHIutStZLbaiY8SrhGCcEkFuJ/DO0/+7Udmf+iH8718l48ik7WjwJGOlHb0Djqp+xBYltms
	KQTGdjfIFqJWkMQ931z56wfZAYvzN4jjkcjbPcVZnRNv8LDUT0JQtitDEY55oUtNS2V5Lww==
X-Gm-Gg: ATEYQzzlAeQvrlTH98XIbh06TR0MjghnKbG1N7POW7qfLlWV3Pc3CLr2qlGEjLAYUqp
	dxIF88g+RmUApdXYkNGDC1TWSJu9RAkO5P6EJgbIZX1f5AsJXvS1rEr958MTe6JHcha4jcTgyKd
	XP1/S20I2KePmNg6wMtep+lVlKsruWcASy2iWAwaXS/1tqCMUqtSz+0Cn7YdO8gr4opAuoqtr6C
	wlazeNk6p1JJouIjxaLlgK1Ccjv9OEttIwOZvLOAc6icivJBfoCclfJ2oI8lDBQvmqMhFf7xdZ0
	jTLvS8kIn66M5+vP94CVc1umeUWpdWUjVKGYL714CD4X8I2B1x7bW7/EiwWCqS02hXT92zPqp+L
	2EJ1rcVGEBQlaXYVZfy77fjyyK0YJtI0vb1wIeRFTX+o+8DsFg28aAoa+QC//ZAtameWX+LorQT
	OA71Q=
X-Received: by 2002:a05:6102:160c:b0:5ff:2a5a:30ce with SMTP id ada2fe7eead31-5ff31f683a3mr617817137.0.1772190060423;
        Fri, 27 Feb 2026 03:01:00 -0800 (PST)
X-Received: by 2002:a05:6102:160c:b0:5ff:2a5a:30ce with SMTP id ada2fe7eead31-5ff31f683a3mr617807137.0.1772190059947;
        Fri, 27 Feb 2026 03:00:59 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd35f3esm1176612a12.1.2026.02.27.03.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 03:00:56 -0800 (PST)
Message-ID: <43a7c132-e8d9-4f6e-a0f1-93fd21eb647f@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 12:00:51 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] watchdog: qcom: add support to get the bootstatus
 from IMEM
To: Guenter Roeck <linux@roeck-us.net>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com>
 <20260226-wdt_reset_reason-v8-4-011c3a8cb6ff@oss.qualcomm.com>
 <52bf19af-7cf3-4e20-89ad-813fad8aa9c1@roeck-us.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <52bf19af-7cf3-4e20-89ad-813fad8aa9c1@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IZWKmGqa c=1 sm=1 tr=0 ts=69a1796e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=x4KJXlwIBXNxyCGXZ3wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: ajn-2OicFuON6QD3jC-MsI3p-No7nCas
X-Proofpoint-ORIG-GUID: ajn-2OicFuON6QD3jC-MsI3p-No7nCas
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA5NiBTYWx0ZWRfX506ssEPvOOMn
 zgmJMCeKRRoVBg/T6L6jshr6oCxQ2GWXxmNwkp3LXcsoaTjSLbRNe8vpmmNVoLljQbWdWcCMlYU
 XHgEOS4iv8ImGokAy8LnPgr+ErD3dwtKIFh389uBOvoGNnDL1HZu68l2PBtcSNI3X6WiR35BgjK
 7fxstizYv152kLCewxVNhcFycS/Y8ZL7BgSm/3w4/0KPmQK7ZJlky2BDZneiWDSF/igdVT0JBjj
 1UQwE/sKO2nTHS9i+mn8ST+J3rs3M/kTpqgzNyNuZk6XyPoyuFC5FUkpMWYMu559YAVNu/PekRP
 qbVKigB4gJGpwfA5dzvOFbB1YHUPsxuCq6iyqUAC5pFjsPJjhUq7sgJ3Lo/rKbGvY38demMH/OK
 I0moRkJRD/2Bl81eFhAdkYLoYfoRv4DUOTcKOEUFmigUj7iC5UAmIWR3xEl61Zkta9P/3Ah+S6D
 juAXQcAkotUVQxCTezQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5006-lists,linux-watchdog=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RSPAMD_URIBL_FAIL(0.00)[oss.qualcomm.com:server fail];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8080C1B650A
X-Rspamd-Action: no action

On 2/27/26 8:42 AM, Guenter Roeck wrote:
> On 2/26/26 08:59, Kathiravan Thirumoorthy wrote:
>> When the system boots up after a watchdog reset, the EXPIRED_STATUS bit
>> in the WDT_STS register is cleared. To identify if the system was
>> restarted due to WDT expiry, XBL update the information in the IMEM region.
>> Update the driver to read the restart reason from IMEM and populate the
>> bootstatus accordingly.
>>
>> With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
>> as below:
>>
>> cat /sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
>> 32
>>
>> For backward compatibility, keep the EXPIRED_STATUS bit check. Add a new
>> function qcom_wdt_get_bootstatus() to read the restart reason from
>> IMEM.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>> Changes in v8:
>>     - Picked up the R-b tag
>>     - Updated the comment as suggested by Konrad
>> Changes in v7:
>>     - no changes
>> Changes in v6:
>>     - Reworked to get the restart reason code from SRAM region
>>
>> Changes in v5:
>>     - Use dev_err_probe instead of dev_err
>>
>> Changes in v4:
>>     - Kept only WDIOF_CARDRESET and dropped other codes
>>     - Renamed qcom_wdt_get_reason_reason() to
>>       qcom_wdt_get_bootstatus()
>>     - Moved the existing check inside qcom_wdt_get_bootstatus()
>>     - Dropped the device data and put all the details in the DT node
>>
>> Changes in v3:
>>     - Split the introduction of device data into separate patch
>>     - s/bootloaders/XBL - for clarity of which bootloader is
>>       involved
>>     - Mention the sysfs path on to extract this information
>>     - s/compatible/imem_compatible in the device data structure to
>>       avoid the confusion / better naming
>>
>> Changes in v2:
>>     - Use the syscon API to access the IMEM region
>>     - Handle the error cases returned by qcom_wdt_get_restart_reason
>>     - Define device specific data to retrieve the IMEM compatible,
>>       offset and the value for non secure WDT, which allows to
>>       extend the support for other SoCs
>> ---
>>   drivers/watchdog/qcom-wdt.c | 42 ++++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 40 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
>> index dfaac5995c84c1f377023e6e62770c5548528a4c..bbf229a7b5840714b9429f4b092ec3f7a6a26961 100644
>> --- a/drivers/watchdog/qcom-wdt.c
>> +++ b/drivers/watchdog/qcom-wdt.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/kernel.h>
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>> +#include <linux/of_address.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/watchdog.h>
>>   @@ -42,6 +43,7 @@ struct qcom_wdt_match_data {
>>       const u32 *offset;
>>       bool pretimeout;
>>       u32 max_tick_count;
>> +    u32 wdt_reason_val;
>>   };
>>     struct qcom_wdt {
>> @@ -185,6 +187,7 @@ static const struct qcom_wdt_match_data match_data_ipq5424 = {
>>       .offset = reg_offset_data_kpss,
>>       .pretimeout = true,
>>       .max_tick_count = 0xFFFFFU,
>> +    .wdt_reason_val = 5,
>>   };
>>     static const struct qcom_wdt_match_data match_data_kpss = {
>> @@ -193,6 +196,40 @@ static const struct qcom_wdt_match_data match_data_kpss = {
>>       .max_tick_count = 0xFFFFFU,
>>   };
>>   +static int qcom_wdt_get_bootstatus(struct device *dev, struct qcom_wdt *wdt,
>> +                   u32 val)
>> +{
>> +    struct device_node *imem;
>> +    struct resource res;
>> +    void __iomem *addr;
>> +    int ret;
>> +
>> +    imem = of_parse_phandle(dev->of_node, "sram", 0);
>> +    if (!imem) {
>> +        /* Read the EXPIRED_STATUS bit as a fallback */
>> +        if (readl(wdt_addr(wdt, WDT_STS)) & 1)
>> +            wdt->wdd.bootstatus = WDIOF_CARDRESET;
>> +
>> +        return 0;
>> +    }
>> +
>> +    ret = of_address_to_resource(imem, 0, &res);
>> +    of_node_put(imem);
>> +    if (ret)
>> +        return ret;
>> +
>> +    addr = ioremap(res.start, resource_size(&res));
>> +    if (!addr)
>> +        return -ENOMEM;
>> +
>> +    if (readl(addr) == val)
>> +        wdt->wdd.bootstatus = WDIOF_CARDRESET;
>> +
>> +    iounmap(addr);
>> +
>> +    return 0;
>> +}
>> +
>>   static int qcom_wdt_probe(struct platform_device *pdev)
>>   {
>>       struct device *dev = &pdev->dev;
>> @@ -273,8 +310,9 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>>       wdt->wdd.parent = dev;
>>       wdt->layout = data->offset;
>>   -    if (readl(wdt_addr(wdt, WDT_STS)) & 1)
>> -        wdt->wdd.bootstatus = WDIOF_CARDRESET;
>> +    ret = qcom_wdt_get_bootstatus(dev, wdt, data->wdt_reason_val);
>> +    if (ret)
>> +        return ret;
>>   
> 
> Why is reporting the boot status so important that the failure to read it
> results in refusing to instantiate the driver ? That warrants a detailed
> explanation, even more so since it is not backward compatible.

This only fails if the reference passed in the new 'sram' property is present,
but invalid

Konrad

