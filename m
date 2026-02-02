Return-Path: <linux-watchdog+bounces-4870-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJ5NBfudgGl2/wIAu9opvQ
	(envelope-from <linux-watchdog+bounces-4870-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Feb 2026 13:52:11 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A081FCC816
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Feb 2026 13:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B72A1301AA64
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Feb 2026 12:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B288A19E96D;
	Mon,  2 Feb 2026 12:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NfsBove8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BHHVHWjV"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0B0199FAC
	for <linux-watchdog@vger.kernel.org>; Mon,  2 Feb 2026 12:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770036624; cv=none; b=k9mZLwSAB1hd/esAdFXbSqmQVCJckBV0Bswmej7NpAbGZNFardqX1EBFDI2aWSVX9KU8yRduKBmtun9VnOGDq7f0gpyvo5TFD3k4e1I1uIDPjeg2R+BZ4izWQx/kjjnznaDpNl2Ibt73RcDngqZgryQFjFj4cBCWYDLi+sBveTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770036624; c=relaxed/simple;
	bh=qt2kHAGsQKo/xE0A3dX1K4NjwU98z3FU+Gtsw6xxWDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gsex4lylVcNTEp+U5kARHtDqV4JM8YmbkmjDW/KNHlLu61OGZTOFEeOo30oL4nHC2I/gclyaArmf6/gIs3QXNYXXhIQ7EkqhuBXK8q3nsNiYEerOKAfj+oXz6KfYK9YmC59pFD0FT0KgaCmdCi8FHzt8oDmR/dr5jg6u0x5J3WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NfsBove8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BHHVHWjV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612CVUoY2357132
	for <linux-watchdog@vger.kernel.org>; Mon, 2 Feb 2026 12:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J6c+Mh0uKjmvgW5h+hi39oewlODEN0YuUXn4CLhEsFw=; b=NfsBove8Q6RnUb1Q
	Krl5VBvDgzkl94GTQj/sBjWzvOy3I5J/+KBpeqaUtnvGgSvKUlecj7BxDB0uvNgL
	GuJZouJtSZR8LUJAVF2cB7UsCFzgq0U3xYu7igRUQsdu3g1jL3t0CavJWi2VWBv+
	ByFK3Kajls6FaZgN4bdlChawgBmXzoosG/y9T2BJ+aKtHxmHbKqY7I+pVKvq4jWL
	NpnRZWqmav+p/pG3SDZ62WiwPXiBYG57sfnW6Tky4f/vo1NvbpJ3CIunwJMTUoSC
	6Rs2vNOpTohtglMRShaoGj5CqsrgpJLzSGooO/2SPCVrZ4zqjfoUiqTJ/a9SvYTH
	LV9JUg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0m81j1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Mon, 02 Feb 2026 12:50:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c61dee98720so2659154a12.0
        for <linux-watchdog@vger.kernel.org>; Mon, 02 Feb 2026 04:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770036621; x=1770641421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J6c+Mh0uKjmvgW5h+hi39oewlODEN0YuUXn4CLhEsFw=;
        b=BHHVHWjVF5uoGUhqKdkusyyKCENqRfE8b7KxPt4QXfIxRZmemC8KICrP9fXmU7WCvB
         S1pAhVnGFY6QDsLACmztHkwr+Aq3nzx9r210dEj8ZNrtrwcvEp375aqPm7yBlpTYJJM/
         Lo5YBbKkEaLTSMBk18U0OCNuvhBflW5Mg7YhktTGTiI2cwLSCVP+TMG9oPR67+rsZ5nG
         QR6VkMY108InsKLC8LMEz27z54C309HYgtpc8Z8j2PpFLuAtorrEna+5i5qd+Z+ZdWNr
         68ZfQT7me7C0H2J4JrlJ0+xrVhrUwfqBR7Bm/OGpzu9rYTUJt6OvMyM9nsNj3y09vAEq
         bZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770036621; x=1770641421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J6c+Mh0uKjmvgW5h+hi39oewlODEN0YuUXn4CLhEsFw=;
        b=p7HG6h2eNjudh83JbnnCsjTY4ymQGCg7NiEBM+kYF6YuYjWTTAxt5vRuHlSWqLJ2JJ
         aspb9d2OSA6d1pDK1aJEO4fY/XrhwPquKbdr/hihij1ER+3NYWvBEvt3W3jtxiKzWJ7N
         VgAc54olofq/2D0azrB5ytjj8Yg+qQKkJcPKriXHFSFYkS74Sw8xosaT+TPIZKvyO21B
         KOKuiJAWViYujDI4/MFqfnKxTnX9i107nmKUzCdN3An8Vf0AidAwiQeIXyDFbcfQDqeK
         DAvqrfqZc5vgZjMT7j6bdY8fmwxcEfaSMznhhisqpbEhc7lHrIw1cBlWNfmPICpEL8ul
         BiZg==
X-Forwarded-Encrypted: i=1; AJvYcCXnUpoTjCsuztphB+BoQ6E+f52+IcNp+gjU1QOiU3PHGkcQ0N2nXdOP0OB8iU6z4w/7awFAYYte91T7Fbzrnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYTgr7rV0GdGq2huHIr2e2QRyiUbt1Y+ElmpRDjEsOzMKNO16Y
	wSKUURYXJnnjuzAgr3Yink6QFLY96Y1zaPpS9vRUZSegS+tPY7DrsjXzC2EA3JURvgKOsGd6E57
	o2McClmLAWpWoDbKaVOTGbwBFz+8pAaqOjwv5Ild/nosGr909pXjTQnh+q/jo4WEqp/JKbA==
X-Gm-Gg: AZuq6aLAKVXb70S306m3Bna8n16Wxf1BBCbf7ZsYE1ZRPfCTCDZe83HIaJ7xvK7/iJK
	EnMsJm9WgkHF/zaeqxg1MYmJ3bdaAdfltNJtx+aKTRW9Jn4GuDSgIiyKxnbkYGVr9D9Ee3Yv0vs
	PWtRGr4fnPKrQyA7LFNhDOrNQdp848mbSU0ohqZ6TrUqmIq8CzeDx+rBaFRnHCv8UZ7tRtBwnzC
	f7IdaHn/Z1OHaska6kopq87jczL0M657bwph9FRPVypHrxXDKhgjrsqJtuoxRl/5pvJfPFxVaVN
	xuL9qlLFbESIRj/x4RwBTcL008E+3FT0VEeVxZl4oqrjBGTBKY5RSLv+2WUEUvbrX0kqjXe0o3a
	1QXo0xMoQLKdbYlFqPeb9AMjtnMrVmPBaEP0eV8ZXXl9iifQxyPm/qg==
X-Received: by 2002:a05:6a00:94db:b0:81f:99a4:190 with SMTP id d2e1a72fcca58-823ab643c11mr10652519b3a.7.1770036621012;
        Mon, 02 Feb 2026 04:50:21 -0800 (PST)
X-Received: by 2002:a05:6a00:94db:b0:81f:99a4:190 with SMTP id d2e1a72fcca58-823ab643c11mr10652502b3a.7.1770036620571;
        Mon, 02 Feb 2026 04:50:20 -0800 (PST)
Received: from [192.168.1.12] ([122.164.84.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b1d024sm16258928b3a.12.2026.02.02.04.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 04:50:20 -0800 (PST)
Message-ID: <24bccc7c-8b86-4c12-a869-49bde7b2e44f@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 18:20:13 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] arm64: dts: qcom: ipq5424: Add the IMEM node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
 <20260130-wdt_reset_reason-v6-2-417ab789cd97@oss.qualcomm.com>
 <2a19de94-8a5a-4fd1-b15a-9b76ea5076d9@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <2a19de94-8a5a-4fd1-b15a-9b76ea5076d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dceNHHXe c=1 sm=1 tr=0 ts=69809d8e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=0VawqKFGzM+h848LIW4odg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Im0m2ywfNG4mJcU91AUA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: FWeR_lZ9aJcqMMrQJKVrb5bQZB9k8jSs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA5OSBTYWx0ZWRfX+JeOkNyly73v
 ajLeBVrkP8sL3CQcrZ2LV1qRA3q1bYw7z+fgSuZBKIpa3NxMA+XlHOMlYMzBZTnQ3YGog7eo2Ne
 5SN1ilBRYpN7KWN7BsCxFX0siCqMxWZMi3rE4fNoOx16xVKbJX6DumqoqTaMrw06lln7Qep3SLA
 xumVCCV4GqmM50y75j0meS7Q1kwMTp6Pi7NmmbkStEuSIxl8hhgFVqKa2h4MFmwimLxq1uy52GJ
 nER/tIBeYDbftkaSlAs9f55ZbkkNBRISX6gshXnW6oFeiveO4VE7tymRCRCahBI9tgoLjQtmvgK
 TzSQu1ugWXf3JKEv7iZowSfhAd0ftae2ZG3AnHcdaP4jnXnUdlfkESq0wHY/BLZ9a4DrzCHwd6W
 TulgWOfIno2EP9MSpfhSLv0yTuTzQilpPimtG+uw7KBMa0qMi/zTpMkQQQCl0812RtRPat9N24P
 P2UXefgdy/r08bEeSCg==
X-Proofpoint-ORIG-GUID: FWeR_lZ9aJcqMMrQJKVrb5bQZB9k8jSs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020099
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
	TAGGED_FROM(0.00)[bounces-4870-lists,linux-watchdog=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.131.57.192:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A081FCC816
X-Rspamd-Action: no action


On 2/2/2026 5:53 PM, Konrad Dybcio wrote:
> On 1/30/26 11:44 AM, Kathiravan Thirumoorthy wrote:
>> Add the IMEM node to the device tree to extract debugging information
>> like system restart reason, which is populated via IMEM. Define the
>> IMEM region to enable this functionality.
>>
>> As described, overall IMEM region is 112KB but only initial 4KB is
>> accessible by all masters in the SoC.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>> Changes in v6:
>> 	- move to mmio-sram and drop the Konrad's R-b tag
>> Changes in v5:
>> 	- No changes
>> Changes in v4:
>> 	- No changes
>> Changes in v3:
>> 	- Picked up the R-b tag
>> Changes in v2:
>> 	- Describe the entire IMEM region in the node
>> 	- Explicitly call out that initial 4K only accessible by all
>> 	  masters in the commit message
>> ---
>>   arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> index eb393f3fd728f0b2fc8cd93c849f8c170d76e312..90790f99f0597b63801d4e07b9b72cd372ad46d4 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> @@ -697,6 +697,15 @@ ssphy_0: phy@7d000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		sram@8600000 {
>> +			compatible = "qcom,ipq5424-imem", "mmio-sram";
>> +			reg = <0 0x08600000 0 0x1c000>;
>> +			ranges = <0 0 0x08600000 0x1c000>;
>> +
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
> I think you may need to add 'no-memory-wc' too, in case someone uses
> any of the sram functions on this in the future
Ack. Let me take care of this in next spin.
>
> Konrad

