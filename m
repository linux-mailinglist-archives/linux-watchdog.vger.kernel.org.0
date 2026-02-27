Return-Path: <linux-watchdog+bounces-5005-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sN4rCRVmoWkCsgQAu9opvQ
	(envelope-from <linux-watchdog+bounces-5005-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 10:38:29 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A7A1B56FC
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 10:38:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66323306B9F9
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 09:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05AD7389479;
	Fri, 27 Feb 2026 09:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pD49iwOU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GjpwP8yT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E368E2798E5
	for <linux-watchdog@vger.kernel.org>; Fri, 27 Feb 2026 09:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772184917; cv=none; b=lZpPWHf327tGTthe7eZaWlBSL0+3kogJet4mPq2OhxA4OU7S79Kh8qPpw8DTIuZ7zei+iHoK0ZUAs+vVjdW1puJY5VfAyxK3gcTx2vJjjeJ/t5Qh2CzpisdDWPMp4UmsFeiUMpHhFsyrQXCl7A/K2QvfG6hvZZn2ZCO2geEEG8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772184917; c=relaxed/simple;
	bh=/D0gi3aoeLq+XBFLUHEjo0XS4gE6a55Euh+WzD6ZeXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=myu5G5ofLVHc9PJr03o8ld2OAYMfr3wIqPRa787NsRweZxEDvoMRmXJA1qPo+iWSL3lhuVR493r5exon4KjuKNuhVw1+2JV3G7N6TE2hIZLJAwUvfrLPHiycGSoj3Z8Yvv0xdyy/v9uHw0OtpRgmBPgQlBDn0E0gtOKSFc3Dp1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pD49iwOU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GjpwP8yT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2KIku236930
	for <linux-watchdog@vger.kernel.org>; Fri, 27 Feb 2026 09:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6xdyDhKWmYiO2wmW9pxHVpHSeSQBV3OpLENsiatFnmA=; b=pD49iwOU8+PrxhJM
	CdDOqIdJBJSHcH6DPSrb4XDEfUFIHlkk+HCYGZ5xNkf4OExW5QYSYJeg6fhaT3gp
	NOUTsjLY6XU0yb+EuF0KQBWqW8dtHfWkj7hGM/S3I/GZARMh/FL3jTaD+b569Mcf
	wm5DUf9ESPRuqHrQvVXLAeUkmz5DM0UDmeulnnx0fip6/d0DqhsfBff8v/e4gy82
	+2PB8U+OSfesXxt9oB8CGbTlVq5BJq9KbISS17ZnTDB7NNXVKCllurdp7xH4V6cv
	5RHmKu3FrZGCYCQXjkrQlXPzWCmUjK+TF5BXIBa1IoIWXbPmKPusQgtwmjYMlD+K
	IXvdwg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjx1xsyhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 27 Feb 2026 09:35:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c70efa3b730so1029104a12.2
        for <linux-watchdog@vger.kernel.org>; Fri, 27 Feb 2026 01:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772184915; x=1772789715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6xdyDhKWmYiO2wmW9pxHVpHSeSQBV3OpLENsiatFnmA=;
        b=GjpwP8yTkZYMeAcS2v8zfVU7xLVP41mwTcYBVrvgnIC1iAVwoOU+viNkuiUTS4ZUzn
         jexlr0dMW9jtrCXvpdb2TTA/rpUCI1v8YsfHTsSFuTdLDWMlGx7PspMIv1WAVFzFDzFI
         DwEAJSI8upZmfSc77Dwr0O4r0bhQg4NZhInSLgMfCGCqJrlaXCuat9eBhkbs4JCr2sFg
         APxq5/kc8le+8dmT7cyf+H74KBdn+oy4teR1HSNdXUqm3q6Pl8MjqkE4iV9GGi3nURqS
         nFQtc4BWzhm6p6FxlIgnY2EDAB9PXsdLKvPunczFCLcO9KrdElFkf13slQajikInIfiB
         4d5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772184915; x=1772789715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6xdyDhKWmYiO2wmW9pxHVpHSeSQBV3OpLENsiatFnmA=;
        b=ZTCX//0KbS0MypzGXEY5X9GkF5c9qSgcMw1/sZzIRH1keDfxi4BygribBl7XxdDCEB
         p/0310dvyyJInW55rkd+xp+8EFe3n+dTYunJIKDfDzxjxL+vhtAU7zD/r4cCb8zpMhQX
         Qp7taFYtd0bFJVStihJYHa7eP4PU+rgOVR2RAgmhMo8n8VF5pZ76NAyKIdABAI0NbCSS
         bIpXZtqPcvJio08wqqGV3lYmFZxgaBtp/IDMhrtAHcPxUTa8Q5TlLvFCgok6AHWwRcpw
         81yTCxlExrnAprj/UvR+p2g/r/R2uRX+Te45p5SizZsJuUspRNeh3aS/xS10uA4dT0ua
         m2cA==
X-Forwarded-Encrypted: i=1; AJvYcCW+8MpTegv3n3LPDfxYOa1ocT79vjSTM4VO1unKR0aJALaHtnuqBjSyVRx+n/oTV17Oz6SfU6PP3wv1fIa+Sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxI1r48F9UVPMSD0VmGm4xzKx8GRs0HIpX0GhSuCzFKJRpGxOjB
	5Qxg56TkVFNDOv31Qp9ekTTf2Vbrkk3x6eAklElPLFUs63gxFVOZWcoaJqqSulxWQyefUV+/swh
	0VUB4G9YDWDGyVU1xC7LJPxKhgauidTRw8iTAU25PvTvFddRfZZ4bE0PdqDw/0QU+CE52OA==
X-Gm-Gg: ATEYQzyBT0LEb5ifmidntTqqK/TJO9C6ITuWrLR1Rx5+mXUf24M0Y1uibSZsNoh3FQP
	brcnzyWpNZNLvQmih56M8kw542XkfAJDxPX3Ybm6GxA75WYIwkrcbVo2LLtjNr0KE4Op/c4gNlo
	DQaK4m4yFU27QOoN+bG3CoDuX94duc4pAJm47bO35jPL399Kxhm8tTTKsOyIeMyZZvFcT5Agils
	CpW5NRFFIkJ4N6tGX4qjX3p0B81ASZl6MeQKwJj2D7JCCFRydPoW7WDFQeVIMNXAmmY4DRI9wSA
	FychjXkAixqVh0pP8llYQCdKLyDaQ3Wn22PlK2EpmYkuAAOVoQdsNAfK6KLKaOGvbi8lhATvwAr
	Kuc9j2KjsKBnmMNvjrfHxtzb5cyMFcAx0yYjg9qjamyFeJrw5Mq1cOwDU3jyzEktECw==
X-Received: by 2002:a05:6a00:94c1:b0:81e:7496:f826 with SMTP id d2e1a72fcca58-8274d9ebac7mr2340063b3a.31.1772184915539;
        Fri, 27 Feb 2026 01:35:15 -0800 (PST)
X-Received: by 2002:a05:6a00:94c1:b0:81e:7496:f826 with SMTP id d2e1a72fcca58-8274d9ebac7mr2340034b3a.31.1772184915097;
        Fri, 27 Feb 2026 01:35:15 -0800 (PST)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4dc6dsm4680574b3a.6.2026.02.27.01.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 01:35:14 -0800 (PST)
Message-ID: <3f236e2b-4e07-4487-88e2-83891388d352@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 15:05:09 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] watchdog: qcom: add support to get the bootstatus
 from IMEM
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com>
 <20260226-wdt_reset_reason-v8-4-011c3a8cb6ff@oss.qualcomm.com>
 <52bf19af-7cf3-4e20-89ad-813fad8aa9c1@roeck-us.net>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <52bf19af-7cf3-4e20-89ad-813fad8aa9c1@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 38GwhdhZO_i1f2IGm8Qo4AzY7VOPi3Ra
X-Authority-Analysis: v=2.4 cv=Vtouwu2n c=1 sm=1 tr=0 ts=69a16554 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=43ht1-M-mn3fQUkTlsUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA4MiBTYWx0ZWRfX5LmgZurhKngU
 UHjdTvoWw5g/ojp2V9h5mmuAV8cCX8xlHqtYC1MmpGywr5//+72dmQdndKrVzPDWsXNY48ViTq0
 CmWiSR+CxxH2fJ2/aR88nPvZ24xrIgXDuMGlnRhuF0q1c83lLx0EC6yOD5hloR0YxkNGAn547Se
 DhcubwSxIEttL7/758eGyc5d/o+EB6JkMlWVRb5vOtdDEd3RdCevdNO75DZ6CpAUqmOxdQTQcpZ
 ef8edTkYoSYppo3CjQRlX1Q1huOmlsW5JkdAH8tBzy78MEJdR5cThqzHjlBCnTmjZ3AMqKUIEHr
 XZhZnpeOiaOd5exoQUhv+9WZw6M7RzRfMFmtSgY6rW3lTES7cAHq0rGQC9Ks/l3UWE2ApxV119Z
 4UdY7jteUBhWDsTMgABUicLf0BN6Q99gvcHfIQNURl4Ak3zwq7n2H+nX/d6M6SGRnLtI/ok7ngu
 VxxJ0iu3oWeLHbvAYPw==
X-Proofpoint-GUID: 38GwhdhZO_i1f2IGm8Qo4AzY7VOPi3Ra
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5005-lists,linux-watchdog=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 70A7A1B56FC
X-Rspamd-Action: no action


On 2/27/2026 1:12 PM, Guenter Roeck wrote:
>>   -    if (readl(wdt_addr(wdt, WDT_STS)) & 1)
>> -        wdt->wdd.bootstatus = WDIOF_CARDRESET;
>> +    ret = qcom_wdt_get_bootstatus(dev, wdt, data->wdt_reason_val);
>> +    if (ret)
>> +        return ret;
>
> Why is reporting the boot status so important that the failure to read it
> results in refusing to instantiate the driver ? That warrants a detailed
> explanation, even more so since it is not backward compatible.


Ack. Let me just log the error message and continue the probe.


>
> Guenter 

