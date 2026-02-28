Return-Path: <linux-watchdog+bounces-5018-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACpiLZnfomkV7gQAu9opvQ
	(envelope-from <linux-watchdog+bounces-5018-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 13:29:13 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5794B1C2F25
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 13:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BCDA330349B8
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 12:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FCF43C055;
	Sat, 28 Feb 2026 12:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mX3so80g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YRp0oV4g"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACD742E01C
	for <linux-watchdog@vger.kernel.org>; Sat, 28 Feb 2026 12:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772281751; cv=none; b=t9B2cwaOKvAR+ve6k4kGFEf2736Xvu4OMUleTBdKdWa6tp9onxK5SACxT70V7T9/ehse1ot79+R31UDLBE2niMziuLfh7u7PNyZhVLMAkUou4/YD/oKLRArPtteoJdC95R0fYvPouP6NHanCQxw31jxdsq2oZiNJplXM4UdRAPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772281751; c=relaxed/simple;
	bh=LQqeUUI4eIoxI+wnuzm7y+FRODsvxOuD4mSpp8+hpUg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=stwZzZEni5cWfWLQYrbV4nGWWHJsCHJZoJlk9FpFhxWcwdEV3lDdrjNFCXk2STNayohiCdwycPGA3HQBQZjL7mlCSRjQstheQlUFQ2sPvYZYWt392Bp3brkgYDv8EzAdlyMH6DfylL2SGQhdG+k8Uw3sGbVwY133ivaP4Ha0fkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mX3so80g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YRp0oV4g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S905Kc2001789
	for <linux-watchdog@vger.kernel.org>; Sat, 28 Feb 2026 12:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5NYtt9kmT+nvQOth6ffJUP
	TCPJ+FKctS8emJa4pNm5I=; b=mX3so80gshzRtLMyXeYrmQKVYwJL9zIxcHJ/iA
	DITjYUqJ1bvXhjIqiwCVhletHef7WIfWmmj+FejGlWoNbRc23ZQTZbt5CQubU0Gp
	ddZoY6D89QhZBhMhCZL0pV162VE1c0eYyjPjtSd16CxgIhdbR7F4GbIzSq7q9UX/
	ypmqzl9gWdrmAs1m+czcDy6BF0FO0jUs0DqM708YXz1FgsDlX7lBHHg34Peyzzkh
	gPB4H9ktoe/uE2WjCezkim+vaYebJzWG0/oVX+gKq8iBdDDhiFfOwSez0KHZFzoe
	b3w+WeUKo4ZKVDUeTJybViq64K/sc/iUlyuDtaGTkLJHq7Ew==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksg70stm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Sat, 28 Feb 2026 12:29:09 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c70f19f0f37so1666704a12.0
        for <linux-watchdog@vger.kernel.org>; Sat, 28 Feb 2026 04:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772281748; x=1772886548; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5NYtt9kmT+nvQOth6ffJUPTCPJ+FKctS8emJa4pNm5I=;
        b=YRp0oV4gyO1YkpAceIdmZtl2U1NlrzKElYMDV2bw1FG4u7D21Apuzhv5J2Fp7/G4jz
         oT/P5RcsaRFupibaainTdmhdIsqDZ/R82u0qNvOsO+wFH/WIH/mysrrt4gMZiAq2wjP/
         uv9Gp8SyHUfyaev/Ie3WQ/HdhPrTr+DYgF1A7K5UBGr0fdKb8ssAbad/VWZfxlyf7vxG
         l1mxwiY3ZGGbAiz/VzJR/DULfJPal0GOqfQ/wzXb6DdTSlDRusNvaWDF859f32DiW1d7
         qAwXkQaK3kS7Yy4c9KbuLuN3EMrRTZRc4kgHndkYwUANs0qiVOYLeyHLnrZibE9m1ZiU
         C8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772281748; x=1772886548;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NYtt9kmT+nvQOth6ffJUPTCPJ+FKctS8emJa4pNm5I=;
        b=ofMkkTPDg+fLa0Vjs12kHGJ4qNW/Blx+/6NUKAh4SXR5XubxRXkKfMUhfx6QiLRQXA
         7u05r/me+ZYPfYLf0lqaBX/GzIveeIQyD1vRJaoPSOJyIWK62tzHai64ss525RhltLFJ
         tYqI3CTkRV0++UEi/MK1giZXQPdDF8IEBjIbVk4x0PCoOBLwNKrGuq7f0/hfoOcWDoqm
         t57gk6+55qQ1CVznl/F3PFE0ivA49as7T1vGeEOKwwwZUz902oreyuKrtsalm7MkAskA
         j/H/9y5R2jzPsxRCSdpBOw6hyjq7fft5KRVbhaz14KQva+VVE0SHyDnXZYVpebqhhphx
         K8AA==
X-Forwarded-Encrypted: i=1; AJvYcCUJp3VaIyG7y6uz17v3jURZddF29PU/YIFcdIvt5g1hXFxSkNL9EfDN0HEmIGtFtH07BlVUMU97x2rPNKoytA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZgHOoF4z5jXLd4E6AkOD3fxnEcejf7qtI6CxpPkEY6eT53uV9
	ArKS+Kg+4WgolF+QQ9MQBGhHEgwddj6wsrju4cUJFFmK3fvZY5ilWKjbP7tvEleXofjSkqn4ytd
	oSgOlk2I+G2ROOjBd/ZX+W0uHUvcx6CQCLiTIdpkgNg+nA/K19jI5X8SukYGTFSjE5gI2Gw==
X-Gm-Gg: ATEYQzzQCAeouqzDFP86T7V5C5axyKGDtiFwBtGV1ohRlPt1Z6/upf7f96trWMZ4OXG
	GC6ovbOWzSGjMuwadgdDeTlsGGzF4gMApH9CqUbaXL+mGeCaHNZvztpp6YaEpXzYKZuraox0P64
	JsT0cr4p07+JdcU3QTYgUytU1ZDdjGCuavKudq0vkhL2DFRXfWBeJJl1MZzRj1FJChWem4KzqoT
	+2jvH5Bq5Hnm7AJVOuQkMsrdAt9HOS8eUDqif5RV58On96FtATIWaCjF6smAZX9BzjB/PPn/MmM
	Gq3hzSQ0xJlPi047bhbYtv6bntny9CI/fGbLGUoEPPJqTVDjL32nX9RN8qV4X7Oivd2VA52JWwH
	MwuTPa9Y08HGoPXBpKGIqSSS8PBJ4fOtyl5YvbbLhkFecyh7kylE2vzygjiwHKE4sJKIzTVcMTD
	HX0OnrIqkw187wJ1oIrA/cQ54ayeJ5cW/HQ71kHmk1uhcuhJqIk2sxNf1o
X-Received: by 2002:a05:6a00:4fd2:b0:823:1bc7:ffd8 with SMTP id d2e1a72fcca58-8274daf6851mr4783214b3a.9.1772281748081;
        Sat, 28 Feb 2026 04:29:08 -0800 (PST)
X-Received: by 2002:a05:6a00:4fd2:b0:823:1bc7:ffd8 with SMTP id d2e1a72fcca58-8274daf6851mr4783193b3a.9.1772281747432;
        Sat, 28 Feb 2026 04:29:07 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4e10csm8130048b3a.1.2026.02.28.04.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 04:29:07 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v9 0/5] Add support to read the watchdog bootstatus from
 IMEM
Date: Sat, 28 Feb 2026 17:58:59 +0530
Message-Id: <20260228-wdt_reset_reason-v9-0-f96d7a4825d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIvfomkC/3XNQQ6CMBAF0KuYri1pi+2AK+9hjCllkCZCtUXUE
 O5uy0YXuPnJn+S/mUhAbzGQ/WYiHkcbrOtjKbcbYlrdX5DaOnYimJBMcUaf9XD2GDClDq6noKV
 uEJhgIEmc3Tw29rWQx1PsrQ2D8+/lw6jSNWGK8XwFGxVldMdBV1CUpi7h4ELI7g99Na7rshgkm
 SN8HSHkigPRUbKWFWCOHKs/TvHrqBWniA7j3OS6MJVqmhVnnucPuT5k+EcBAAA=
X-Change-ID: 20250610-wdt_reset_reason-7a5afe702075
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772281742; l=3842;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=LQqeUUI4eIoxI+wnuzm7y+FRODsvxOuD4mSpp8+hpUg=;
 b=iLQkzfZNhnx7G3in00XjisfXMH944sWs3n3AXSsp8mTsfrJYmC4uZUFOQWNeJXOAuNDDt5jFi
 UsrZXMU09TEBYOA8Ah/qS24fY6TSO3jpZWt96rzNDQ6mdHTICYyZQyr
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: s9AgpGK9yDybP9-BtJGHpiPZ-JWnbiis
X-Proofpoint-GUID: s9AgpGK9yDybP9-BtJGHpiPZ-JWnbiis
X-Authority-Analysis: v=2.4 cv=FaA6BZ+6 c=1 sm=1 tr=0 ts=69a2df95 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3xu3cfvniY9m67ySxx8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDExNSBTYWx0ZWRfX7sJTbNQgQThc
 mS7UohmHapGlqrBOkIL4oI/W53UbPhaDui5d0SdIMrHH2FXnBcM0pw3TRKVx2m951lXKxnNRSAM
 L9MAOnDNUYMliip8rprMu8efxHSQdfIlWoTY0h90jAuefyP66T5IiPuFGs2sO0ECo8jmThW+OQZ
 j+Cj1sHrlfAZQNgnOnobgklVgoECxIF65UuknhUwgStkiL8sub8RIUXJn3zrhGEmmX5MfmoE7nk
 jcQj+527Zyad9x8fSZNqlUIhKGH6TAAKTbfosRWaLn03BM0cykdRWd8SVXgKWEE2j0aCA59dHCJ
 VDdXGaHgBweHSsTP12q1gf80aNHSI6axngqdVE9Kw7Qf1Z5g6AxmQgbBohSl0ZLGHKwhFExl2ul
 MFCKsXwJnlu0XE+9lE2k6dpZOtcQvxJOMT8OW2zhrRUMElJyO9Ha7XuYLYNggKGx/LYpLIimOqw
 5bphLJ19Xq8OwScdn6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280115
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5018-lists,linux-watchdog=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5794B1C2F25
X-Rspamd-Action: no action

In Qualcomm IPQ SoCs, if the system is rebooted due to the watchdog
timeout, there is no way to identify it. Current approach of checking
the EXPIRED_STATUS in WDT_STS is not working.

To achieve this, if the system is rebooted due to watchdog timeout, the
information is captured in the IMEM by the bootloader (along with other
reason codes as well).

This series attempts to address this by adding the support to read the
IMEM and populate the information via bootstatus sysfs file.

With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
as below:

cat
/sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
32

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v9:
- Picked up the R-b tag for 1/5
- In 4/5, if fetching the boot status failed, just log the error instead
  of exiting the probe
- Link to v8: https://lore.kernel.org/r/20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com

Changes in v8:
- Collected the tags
- Updated the commit msg with reasoning in 1/5
- Updated the comment in 4/5
- Link to v7: https://lore.kernel.org/r/20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com

Changes in v7:
- Collected the tags
- Added the reference link in 1/5
- Added the flag 'no-memory-wc' in 2/5
- Link to v6: https://lore.kernel.org/r/20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com

Changes in v6:
- Moved the IMEM compatible from qcom,imem to sram binding
- Updated the 'sram' property in watchdog binding to point to SRAM
  region and update the watchdog driver accordingly
- Dropped the Konrad's R-b tag in 2/5

Changes in v5:
- Rename property 'qcom,imem' to 'sram'
- Use dev_err_probe instead of dev_err
- Link to v4:
  https://lore.kernel.org/linux-arm-msm/20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com/

Changes in v4:
- Kept only the WDIOF_CARDRESET and dropped other codes (Guenter)
- Renamed qcom_wdt_get_restart_reason() to qcom_wdt_get_bootstatus()
- Dropped the device data and describe the required information in the
  DT (Konrad)
- Link to v3:
  https://lore.kernel.org/linux-arm-msm/20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com/

Changes in v3:
- Picked up the relevant tags
- Dropped the fallback compatible handling
- Split the driver changes into 2. Introduce the device data in one and
  extend the same in another for the use case
- Link to v2:
  https://lore.kernel.org/linux-arm-msm/20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com/

Changes in v2:
- Dropped the RFC tag
- Reworked the driver changes to use the syscon API
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com/

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

---
Kathiravan Thirumoorthy (5):
      dt-bindings: sram: describe the IPQ5424 IMEM as mmio-sram
      arm64: dts: qcom: ipq5424: Add the IMEM node
      dt-bindings: watchdog: qcom-wdt: Document sram property
      watchdog: qcom: add support to get the bootstatus from IMEM
      arm64: dts: qcom: ipq5424: add support to get watchdog bootstatus from IMEM

 .../devicetree/bindings/sram/qcom,imem.yaml        |  1 -
 Documentation/devicetree/bindings/sram/sram.yaml   |  1 +
 .../devicetree/bindings/watchdog/qcom-wdt.yaml     |  6 ++++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              | 16 +++++++++
 drivers/watchdog/qcom-wdt.c                        | 42 ++++++++++++++++++++--
 5 files changed, 63 insertions(+), 3 deletions(-)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20250610-wdt_reset_reason-7a5afe702075

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


