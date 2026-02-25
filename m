Return-Path: <linux-watchdog+bounces-4981-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O/LMjKanmnXWQQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4981-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 07:44:02 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AD819271E
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 07:44:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5469C301DEEC
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 06:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E0730171A;
	Wed, 25 Feb 2026 06:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhYxMXq5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UW2mwXKL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB642FFFA4
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 06:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772001831; cv=none; b=Xnbh7/fLoGYGcXZYC+po8Xf9Tlb0K3x/fxYrxbhmlvr3WehEO9ePAMlUrKg53ZvLL2J6ZTGLNU87PQiEWuxd2qTRM5v5xXcXLOgoLK4TpLb8nKax7Tq3MKl+ce707W6dOsILHH+vaJ7w6D/XeNl4PBzeNkeW0PQDUUxjVJy7mes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772001831; c=relaxed/simple;
	bh=2/6Degxp7ls2d8D8xPc26dEqc+84ZT2Bgm76mBX3ZCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kDsuGKCU64oAJ9AiUz4hukd8O5678xeHpNMucuEHd1uWqBLUl7pkfJnNYyUwz9qsrK2IkU1j5w79rmvkJON4crmNSCxcf8nv1DuIWjRJBRy6YkaitiTPsl5h8VunJMw99GyulQI1xtmP+tFmY+SMdsXrUsDrfDMcsSwMWIOkSfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UhYxMXq5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UW2mwXKL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61ONolu1133841
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 06:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HRprrDZrnbfgMS9tr7mTH+TkKXh96VfAvqJuPeXhuvE=; b=UhYxMXq54foXaa0c
	IoyfudS6PKi+dZctDirpG27k3eVKN6Lscitoe6imYp8PhUyy5nvVEifBS1lQUtpc
	3KXrxTTkEPpH8j65xNV/7iRiwUX/IHEEGGLyEs+xYJNrQVYr0k6Qh0r6+VdrsiUi
	+F0As6lwq6LHg+YCF1p/7TSzjUmlFuBz6OMcZlqmQWSdblsYdu9nuV21w1YiOPNe
	dRiSjVfrFEhgDM+PQXheBgwrFXUqHWDnCC7NSb0M46AMrGk2A/vAt+tpyjPZsxkP
	tjSTxKr0MrhhSqlVjgFrfOUc4QrX1mRnR72X2kYqDrr5O/+Eo2rN+Fb/bO6IB25j
	9aw46w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chp158yf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 06:43:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-824ad5d2098so2687663b3a.1
        for <linux-watchdog@vger.kernel.org>; Tue, 24 Feb 2026 22:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772001829; x=1772606629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HRprrDZrnbfgMS9tr7mTH+TkKXh96VfAvqJuPeXhuvE=;
        b=UW2mwXKLycG6WmQF/YCEaXWIU/NqNe4v8+ff2e2dAu4fUzQ9WMOPkeUIsU7///7hbJ
         KnN74T6kdsVlgIFujInJwonQ6tW3cjLc6RuOUJq96aG6YGuvfQq2Rvsxwt3yP8iZoSXb
         Se9hqHIWr2Ua37UKe62rTGU0yP2TeZOclfVpIRmIXE2vhljwBAETPNSL0UiV9BYZjsrv
         L3ODhKm9d1hIHIcSIK4yk0lp90BvhkSiMf/whNziNn+chhIuL8C2bxDhSIlDyrIHdCNN
         9Tt9LHsScU3cecY/I8AF2an6fMOaI1ZM412i3rrp8hJLj8gBotVdvF2jAqLGBFUD8Kw7
         fh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772001829; x=1772606629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HRprrDZrnbfgMS9tr7mTH+TkKXh96VfAvqJuPeXhuvE=;
        b=QaKjjTuFMrgYC8fnuuLVH43p6tEI9O3852n/YFypOeWcnPgH/ustl0MWfMbCC6/ZEr
         BaLk/Bo4lgQzqEYtXVDZTcbD5Z/1xTASUBKchpzu95ETOaGV2eUL05UjnOZilY7f/cMB
         j+Jn8hJlCB/6/YVChFPQBxcte6hctGfpcjtHfTvS9sZana0KMw0Z3RGVJDjcSz8htebU
         L3mql0a4PVhaDJ5lOdXyavbrNUvvhavx28uFHDVsCu3OgTk1u/XxuSDFbSIGZ16ZTEZ4
         8imuX4Ug2spqUvnp94P2FFgMkzeC3ydTpKO6XKw8zaPeBVZTLiRIfMFk6P417fJ2WkmV
         4JXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuYsWOpcbZGnoY3XrO7mMWwriNCLZFFnrar/mjW/V2HY2SifRHz/ZGY3vAbkYiGLVlnxOX3bov90YjucFFVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YybpgnEfk6eWjJlcvBGAE/yKsKjmxX/QHHuA3VsEYJd0tSmV50q
	QTtZ0C+saJryVnNdjkMCOrY+TXNDWgRySpK0YHAq/cfoOkyZJ9csPrxM4v3yAulRwgULC0Ljl3L
	cbqjjtAYuo8qGMtsZZDf1w/hHYO4iUi7Fpbvz/nEr6FOz2CH1n5ky77mI0GoANF58mydebw==
X-Gm-Gg: ATEYQzwmga97Sad7LX4nE5XpO8SsF+munTf0Rf/MHZGAcn70tX5u3h3kUBx739qGs0R
	vBNc2o+dh8yO52cYI59BorzfvYXUl5G1ZHbiXGV8e/u46n9XhQbmWliF5f+mMx/xHxY7E8Lhd6b
	Wx7ihwJWib9kdFAnGVR8OKhmqEvjmacK4KG3+f5o9DF0q5g3I2243XqWm61bRMEnTGRcS1DraOI
	3MTwg9h4J/2pQeXI8+WP3qtzH1O5uHt/aLJwuGZGds/diBRTqFnxxmlPGQIqsg3Kh6Nsxi+2Ssh
	KT9iCaFZbxYAaNLv/Z+ANIVh/C7JUCQmD9Sru7FPHTuiJa7qmVStRkywyhtdufUdSxeo8CiRojp
	1A9ONtvZTDIBOLW6qaku4NaknjAneEZirt+trQBjMGtb5/1Ivecm9mhsNs/iCZphxmrFlri4s17
	KXIilPwuQXZHztctMEQPXO1YkXl1oKSBYP2LA6qpgjUD0PEGwbJ+3up2M1
X-Received: by 2002:a05:6a00:3a14:b0:81f:48d4:a979 with SMTP id d2e1a72fcca58-82724aef59amr1164977b3a.49.1772001828575;
        Tue, 24 Feb 2026 22:43:48 -0800 (PST)
X-Received: by 2002:a05:6a00:3a14:b0:81f:48d4:a979 with SMTP id d2e1a72fcca58-82724aef59amr1164950b3a.49.1772001828091;
        Tue, 24 Feb 2026 22:43:48 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd692b99sm12856570b3a.24.2026.02.24.22.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:43:47 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 12:13:13 +0530
Subject: [PATCH v7 4/5] watchdog: qcom: add support to get the bootstatus
 from IMEM
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-wdt_reset_reason-v7-4-65d5b7e3e1eb@oss.qualcomm.com>
References: <20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com>
In-Reply-To: <20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772001806; l=4138;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=2/6Degxp7ls2d8D8xPc26dEqc+84ZT2Bgm76mBX3ZCc=;
 b=GSUHP2MXZT7g9xlSvOjgIR+Uox5ha4fkv4Jp5Vah3qDHUN4xADELEBnGTDciblqr/1Kyy5Wll
 XqQvb5NtzvEDxsKcbX+yt5RgTkKoiqiV66M0S9PsxHZwgRz9DmwJ2Y4
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA2MiBTYWx0ZWRfXy73v6ZAsNj2C
 DJzWJkP6BV19t17boAjvltwuLh63R2/xx+bKYa7sRJDHQTuckfWA+U/mAxHTgKMjoQ41Z4mCSfZ
 TaZZi6ikNcpuevckoeAujVQSdkPWvJscwpu8X72XOq/KAbEWX/vpwOunm+YbpxTy6w/JCOwe5a/
 zCnM1tBqf0g5bKD6S1Rowvo/E6xx86ITCakYJ6McZ4+cgn14axYW2GZZwfbuVShj0eHGil9ZOK1
 EiOycx8g1+43MQjuH4mqZcCpPp0UR8HifuaYbGhoA3HdaLlT/AvdVbZI/Un2fuh5krW/1TfHJLq
 w1aEIj5F5AZ8Qj2NqMnKPzAhTPjrkbUaTRSja+CkLaCY/H2X7407JM+RHBuRKCF4HV+Tz6+urlH
 UN+2ClZ/r1yUnJ1gSKZF53SGT7zH8AYQAvZ9fxcYff/C/eM1gtkVfp9Rce2RsAo/+ztIACrDI+m
 oyjeykLRUOv61OGgjKg==
X-Proofpoint-GUID: R_iENIlGXhwDrn4y-jVD0uWA-9-dO6ag
X-Proofpoint-ORIG-GUID: R_iENIlGXhwDrn4y-jVD0uWA-9-dO6ag
X-Authority-Analysis: v=2.4 cv=etXSD4pX c=1 sm=1 tr=0 ts=699e9a25 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=sA5c4iyB6yEouCyTFbQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250062
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
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4981-lists,linux-watchdog=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 46AD819271E
X-Rspamd-Action: no action

When the system boots up after a watchdog reset, the EXPIRED_STATUS bit
in the WDT_STS register is cleared. To identify if the system was
restarted due to WDT expiry, XBL update the information in the IMEM region.
Update the driver to read the restart reason from IMEM and populate the
bootstatus accordingly.

With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
as below:

cat /sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
32

For backward compatibility, keep the EXPIRED_STATUS bit check. Add a new
function qcom_wdt_get_bootstatus() to read the restart reason from
IMEM.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v7:
	- no changes
Changes in v6:
	- Reworked to get the restart reason code from SRAM region

Changes in v5:
	- Use dev_err_probe instead of dev_err

Changes in v4:
	- Kept only WDIOF_CARDRESET and dropped other codes
	- Renamed qcom_wdt_get_reason_reason() to
	  qcom_wdt_get_bootstatus()
	- Moved the existing check inside qcom_wdt_get_bootstatus()
	- Dropped the device data and put all the details in the DT node

Changes in v3:
	- Split the introduction of device data into separate patch
	- s/bootloaders/XBL - for clarity of which bootloader is
	  involved
	- Mention the sysfs path on to extract this information
	- s/compatible/imem_compatible in the device data structure to
	  avoid the confusion / better naming

Changes in v2:
	- Use the syscon API to access the IMEM region
	- Handle the error cases returned by qcom_wdt_get_restart_reason
	- Define device specific data to retrieve the IMEM compatible,
	  offset and the value for non secure WDT, which allows to
	  extend the support for other SoCs
---
 drivers/watchdog/qcom-wdt.c | 43 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index dfaac5995c84c1f377023e6e62770c5548528a4c..14853162d57ccae3092fb1c01616fdfca0108e74 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/watchdog.h>
 
@@ -42,6 +43,7 @@ struct qcom_wdt_match_data {
 	const u32 *offset;
 	bool pretimeout;
 	u32 max_tick_count;
+	u32 wdt_reason_val;
 };
 
 struct qcom_wdt {
@@ -185,6 +187,7 @@ static const struct qcom_wdt_match_data match_data_ipq5424 = {
 	.offset = reg_offset_data_kpss,
 	.pretimeout = true,
 	.max_tick_count = 0xFFFFFU,
+	.wdt_reason_val = 5,
 };
 
 static const struct qcom_wdt_match_data match_data_kpss = {
@@ -193,6 +196,41 @@ static const struct qcom_wdt_match_data match_data_kpss = {
 	.max_tick_count = 0xFFFFFU,
 };
 
+static int qcom_wdt_get_bootstatus(struct device *dev, struct qcom_wdt *wdt,
+				   u32 val)
+{
+	struct device_node *imem;
+	struct resource res;
+	void __iomem *addr;
+	int ret;
+
+	imem = of_parse_phandle(dev->of_node, "sram", 0);
+	if (!imem) {
+
+		/* Fallback to the existing check */
+		if (readl(wdt_addr(wdt, WDT_STS)) & 1)
+			wdt->wdd.bootstatus = WDIOF_CARDRESET;
+
+		return 0;
+	}
+
+	ret = of_address_to_resource(imem, 0, &res);
+	of_node_put(imem);
+	if (ret)
+		return ret;
+
+	addr = ioremap(res.start, resource_size(&res));
+	if (!addr)
+		return -ENOMEM;
+
+	if (readl(addr) == val)
+		wdt->wdd.bootstatus = WDIOF_CARDRESET;
+
+	iounmap(addr);
+
+	return 0;
+}
+
 static int qcom_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -273,8 +311,9 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	wdt->wdd.parent = dev;
 	wdt->layout = data->offset;
 
-	if (readl(wdt_addr(wdt, WDT_STS)) & 1)
-		wdt->wdd.bootstatus = WDIOF_CARDRESET;
+	ret = qcom_wdt_get_bootstatus(dev, wdt, data->wdt_reason_val);
+	if (ret)
+		return ret;
 
 	/*
 	 * If 'timeout-sec' unspecified in devicetree, assume a 30 second

-- 
2.34.1


