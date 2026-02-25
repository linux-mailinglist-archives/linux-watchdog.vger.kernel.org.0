Return-Path: <linux-watchdog+bounces-4986-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDxfFdXsnmk/XwQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4986-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 13:36:37 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C059D197751
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 13:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 195073078A02
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 12:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEDAC3B530D;
	Wed, 25 Feb 2026 12:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WkiVe8Kd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kZtKk9Qz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7914B3B5301
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 12:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772022866; cv=none; b=HBIc1xemu8T42gQ01yddjj5HqZ7IrHMssjqmoMPljW44xNXtiZPpwHkDsvjiz74swoXlz0vpw8+/+h25XiOm8KBxUKuwzirIPXqFMNxGUD8YKLIwDBmiWAIcLSLsueKE45ZBWhSFwCXlWVf6jYnTAo/Jo8FsuVlkb9QGYMgU8Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772022866; c=relaxed/simple;
	bh=TdhSuflbjwL3XyTH9X8phaMjOghQG/4HOMGxwZtfVAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eg7nITZCNAMdfdDV4HhOJXyiNVnq4ByL6Diuv09HyD/cyVe4V8qZddgyTzK+xIkWNBXEk1DACQKs4PXKnC/1Mdcjgjs//x5rR6xeKFczn5bj+3ffZF4vTYWE6DdLfWw7O2frxRA/ZsORxXJNit3e6rwxdwaHwj2eJnBKys6vcDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WkiVe8Kd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kZtKk9Qz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SqJe229725
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 12:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JACFJ/VGwZJNnMBUOjPmygX4Hql8HmIMPgx6kxcaSXU=; b=WkiVe8KdjNJTxUKp
	fOdxAMGwLDgHcHB8Cym27hsZHg8oBr3un0CxlclfdAgFjhPf0XgRfVbNK7/1sevY
	RH5ffTtdq79kaUl1Dt1mePwz0E0rkPjLDCHw9Nf/mEo1QULJYccTiYE0SzzcjXfP
	jgwru/N7u0Q9gfKmJsnhKctyz/eIGLcrW0ZTkM0ch8rHEFvMqE9HNeWcRHXCeuBa
	ouvHSQD/RPXreid9zZFq7wAcqVEt4xNERVRk6/7QNu5kL7e0bPULMtqPh+gSFYBZ
	G2c7wHJ0TydSWNd+2pxN2pdqxvMrGPAMj3ZY/yEBBr2D/wbvEi8P9PxP7/0ZYC8y
	K79RfQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg37u7ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 12:34:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-896f5c90f07so70760966d6.0
        for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 04:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772022862; x=1772627662; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JACFJ/VGwZJNnMBUOjPmygX4Hql8HmIMPgx6kxcaSXU=;
        b=kZtKk9QzS9q2r64X7vAiOsscPndK+gd8YbLNkhJD+M/CfjJweIgN99MPqXDikfMiQJ
         /nPrzAtblhBmateS/8kdDxHLKaPStD7dcXZxsx4A9SyGA6z50BF5sgHGdv3WKh+y2e5U
         m48nD8IWGCM3dpi8mc2pZct6afIeZrUHtyckPcdAIUbu+WAYOT87uMqDHm89ZS2CINmT
         Wuapb+kX8OOTTyySTxLY5mFSCgcIf3zXAONTrJVWwQcQAzcKaFY+vhRxpESLB5me83Be
         G5kmIpFF8oUDt4yzQVx7Ibo7AdT/b44prpGsO1l6l/ZK/fsMhWBzc7mtrRdQO8nH9BO7
         Z+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772022862; x=1772627662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JACFJ/VGwZJNnMBUOjPmygX4Hql8HmIMPgx6kxcaSXU=;
        b=f/2hPaXUMAHUXNhnpBIKFtLYl2qM9oGtNLXJCFmbfBXYuSIa2Gh4G0ZUJ08GpOMZrg
         h8YuC4dExZw21ouojU8Pyo9lkekhVruYP3KTlCVZneC6ZBnvAL8lNWMVchpymL4PU/a9
         QGNcV14kYWwA4RUCzvfMuw7RmAApy1qUfn3abd0kzSu8GFCbzL4x2Rjedfqu578rBJ47
         rKXUCRT9n6m6KdHJxiGGYFsB3y1qLPyMvbnDQJz3MKq83MlszjFCwjBC2reKD5GsVmFZ
         PRlgKw4tcRAsuV1RY6YjYvRsWzD0x6CR5KlU+AEJnGg13Dnt0vWSUijXpaPckoQYS4zI
         inxg==
X-Forwarded-Encrypted: i=1; AJvYcCXAuMt1cMLLQ0IilmfmPjwpdYLOXt7R2B1xgKuT052NoqErw0+7LfCeZ8Z+FhJtjF+Tfxdbds9+/12UP/bGKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+64O0I2z6BFv1S/edPGIyo8iMBeEaWQfXWRf+vozVQW2NZaJP
	kXU/aJ1p5l2slvSfh85vS3kKsv0oikMJOSetGvanx9xXf62MU7nP2YI+k6+k+fqLekDz459g/bz
	x5JOVzXzfkpg2yFLOj7kYvtYZTeFEqvGBQ4gujZntVy81RmlbNhtvn/4p5+EqjiwIvynFOg==
X-Gm-Gg: ATEYQzzr0G3QCHc4yHqq3Au5Veez36HZyZaYgrAKj8OFdkYNPxMbb0OwJ6Tlv+gu//A
	RK7CcN35TubesNzuPOTfEk7wGVZDFERCmm9fB+Na5g3lGyRgXdWKdCtoVVSymQsXFaiWbCcwSwl
	sQTRHmAQuRpWdq0kxVv1SC1UTXHNkBe2h8CIPjoqpLVbXjyjDTDdsjQ09sgFJ4mxeAcFuRo+bRI
	LjImR+cNPnB+Ee+lY+HsMrAUWEsPWHN1mKN07q+UrZ+hthkIKRXMVaSUU/M6jMRbazO1pFaeZQ3
	1ZNARmEDUAMC/nmhJYpX4Xbzjg1p16JtbXC9Oxp1pLH7Jvf3pJvdd39TTQfasa8W2Fu0fg0igPR
	NlR6xS4f0f6Ad4/wzyC+Jgm3aa43nF7E7jkGsalMoovN7eokKAYZ8bKdc61YLXqJKFBqwPZnu8Q
	6uzhI=
X-Received: by 2002:a0c:e013:0:b0:899:b649:6948 with SMTP id 6a1803df08f44-899b6496b13mr29383146d6.2.1772022861953;
        Wed, 25 Feb 2026 04:34:21 -0800 (PST)
X-Received: by 2002:a0c:e013:0:b0:899:b649:6948 with SMTP id 6a1803df08f44-899b6496b13mr29382916d6.2.1772022861575;
        Wed, 25 Feb 2026 04:34:21 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084c5c514sm515848566b.5.2026.02.25.04.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 04:34:20 -0800 (PST)
Message-ID: <3fc99f1b-6e67-4e17-ba02-eba963714ca1@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 13:34:19 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
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
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com>
 <20260225-wdt_reset_reason-v7-5-65d5b7e3e1eb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225-wdt_reset_reason-v7-5-65d5b7e3e1eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=699eec4e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=gWikCEODulKzl4wm0QAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEyMiBTYWx0ZWRfX+8bVF7MFtuvO
 Av+18r1mFR7wPd94YufOxBGkDfePbmwzrx2E6iTtG1H91d/dVMBc0Olbad5sZAfvK2Bb51rmgEa
 /xNd2wr1TBjAF+pC+3n9CZmkHlmPrAz9fzuxMXZ/7+KD+gZK6zdmVXQO9f58pA660hZ4ExJ2N5q
 gAZDHG2mEHEvcTrpnj2IIV/KISFgTPtVxkhl9jrKjwcwOpr/Vz+6a6iIe27GE3UrwEn5/QQeCY0
 +xyXmOokR+TlEE5r2MKbGqlK5NdB2+lf55Rxz8yiS4IwSnRdFqD584nYzMc3koOuBgPeZFnAp3h
 ej3xmc3ckHjzs4JmyEm1TrQnwD2tkJAi7CGG3HA/fE2NGKyA8N3AbBqr6y2AeHgghGB5n1ThPhV
 B28yfuuSz1KaPC6ccDgW26LR1CrfA4q53lNu1xotFnzq0J+AIFCumHOHbgjrDe/SrNkymQzemQj
 jJB8GzM1xWPazONbvUQ==
X-Proofpoint-ORIG-GUID: AaF3kZBASwofutdQ_T6RnnJwiQ9M2DHI
X-Proofpoint-GUID: AaF3kZBASwofutdQ_T6RnnJwiQ9M2DHI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250122
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4986-lists,linux-watchdog=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C059D197751
X-Rspamd-Action: no action

On 2/25/26 7:43 AM, Kathiravan Thirumoorthy wrote:
> Add the "sram" property to the watchdog device node to enable
> retrieval of the system restart reason from IMEM, populated by XBL.
> Parse this information in the watchdog driver and update the bootstatus
> sysFS if the restart was triggered by a watchdog timeout.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

