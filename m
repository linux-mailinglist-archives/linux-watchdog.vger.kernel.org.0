Return-Path: <linux-watchdog+bounces-3654-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75152AD39C6
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Jun 2025 15:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95529189C2CA
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Jun 2025 13:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE77429B8CF;
	Tue, 10 Jun 2025 13:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NHwoO76x"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E0D29CB53
	for <linux-watchdog@vger.kernel.org>; Tue, 10 Jun 2025 13:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563150; cv=none; b=juWdy93aUUp0iZ4rKekhXdR9MeSJQ9D88RjUOLTEqIj00mCrY85PeQU7rJwlEKFFUPf+OCk95peZiO6DYYIdaXHPCsTxm5O0R1efdUDJJeQ9LAI5SEIiz01A3BzgCGOSU9Um68/AJq+nAj9desZHVi+o/OWDTXbB4qJFBq1ftXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563150; c=relaxed/simple;
	bh=tIkOcJFE+rafh2MgqZmDWTromNT6mSUqQ5PDBWtf60c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eot3bXV05Y1b+zVENiQYFAx2XcE6oDeFE7rP8PYiDLuib5Wk0Mpp2saG8uvC+szZlEIn9Ag49II5SFWTkDqHXnX3DeIaYlG9oFgpOZQB4m5t3zcaQQKLW6x3BTJIIeJa1+LFSsEjwssbWcUU/2SaI1pbiyWJmqxbckhvCxqYtWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NHwoO76x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A6bn6i000792
	for <linux-watchdog@vger.kernel.org>; Tue, 10 Jun 2025 13:45:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2zlECPsipiGdH8hAfvBAtz4pKbhBRjMIfShCSx4B4p4=; b=NHwoO76xuGCplsPO
	n6eZn6zhoCdsTXeuLhU9dbNFeg/Z9BE/ysOdyKzKHPKhQAaG480qlC/r5TLKXJZt
	Lv34ptHv4+dg3chJE1VuPZQikcQLWEYx2qecf+h8Kzg4g36/1B1OBEHA/n+LhEjq
	GeFAC3NTUNGdg6d+FPbTjj1c80lp61S1dZxc8YDWc9Va4FjULMqUikpe+sLXSPXV
	eLgFF6tJFaYCrB/BMmVVcRnW1sVmnkDbik35XImP4YQWk89JOnF3vjrby/NOPSiu
	H0AX0k14BscfIUVbSa7BJ81atUdC4yQpwQBlJakAbMLBIbXsYO9TxUa95Nvhyx2m
	Gi10Tw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2tc9ur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 10 Jun 2025 13:45:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b2c00e965d0so3352356a12.2
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Jun 2025 06:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563147; x=1750167947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2zlECPsipiGdH8hAfvBAtz4pKbhBRjMIfShCSx4B4p4=;
        b=uH3LH6xpebEXNTmwNP9NWSUUbymhjDFl0elDF0U5mUXL21P2BRon84pWenUQa+exS5
         FXTadET+1JdoJyrKrQ0T5+8YVISbuvxM9UcesjxBEydnScCW47o2u2v+npjtoml8fIhz
         BBBKxl7NEqyVumd/Fo2CX8SgZ0B2x032g2wx0fRP7OfF16pdnjjcvSnWflQj9W2nnsbg
         o0G8vKRZ3SStU8vztc2nUOyOdva4qZDz5yzmB/UEshCc3RvvQUMUCSGvXFB3agdFYYCf
         eWpftKFKxFOwHNYGH2LKGUEBqoicrPvUk44qHaJZ00tHFAod19YfwqAkkGm9kQP4bUNO
         NM7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOddAPquKTCiI+fyxk6PFgkLHX0DGBgYIl07axoBgHmcdYaAXJbOLCSYJsK5eoncYOfQRKpkLQPagHBxPHLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4DSA3WaQUDIYaFC6Tmj6VDOJI1cw4up9A0CTDYGZU81EnxUOT
	TJlpDSpdw/0c7CzZ9ks6ttRp3WrlT+3pV701ITtQUlx+f/888gBpnK78VO6qYdLguxT0Oi6HjGi
	e6/TwRR8tjpLNBgEiLXS5OeH26uCpJbBc0CWwWhLa1XK8MzfErj3BLIQAWcoXXhglzs86Rw==
X-Gm-Gg: ASbGncvTiTyy8lEhIsw5z2Kud1Ip7JJ+NwMWHMrtbO+ylRYHtbpSFYVS5tStjiYpJv9
	3e9uqG91z8iRsknzy0QFOlQuOkXdon+vOiYS3z6RBA0XhCB9o7HOsweLb7PtkOQN3+yLMkpg6Ka
	jdhBIDVJHOhV6uFytZ0Ul7HmVDAW9WYt+t4dgfR1UaTDvn4+JLR7SouZHByLoptlKApNhfd9e5/
	0FWMLKl6BKJ2qP50u83O8HqrRgQDScI4TeocjlFHmH2cS9mrnCBNbYUGIxBR8LUqnOae2XR9uzb
	Mg2oGyS/7CPYhd4Hj4foTk8LyaY1aXAhdz/lHYWnWtUyBW5awEpXlaFq/74tLonoqmdUqbiGxhm
	YiWDowYTjp7yP3CVbI9yZuwRSDQ1qSftQ50tvDB1VWzw3z0lKYePTuysNVg==
X-Received: by 2002:a05:6a20:9144:b0:218:96ad:720d with SMTP id adf61e73a8af0-21f78b00d19mr3904175637.1.1749563146831;
        Tue, 10 Jun 2025 06:45:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbD2yzkEoSMKz5KaTlc9zIq3cjy7BteG1YQFBVwOSU21N2znKNGceH1ZhcbWzlMysruW16gQ==
X-Received: by 2002:a05:6a20:9144:b0:218:96ad:720d with SMTP id adf61e73a8af0-21f78b00d19mr3904127637.1.1749563146353;
        Tue, 10 Jun 2025 06:45:46 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee70085sm5858107a12.25.2025.06.10.06.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:45:45 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 19:15:21 +0530
Subject: [PATCH v5 5/5] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-wdt_reset_reason-v5-5-2d2835160ab5@oss.qualcomm.com>
References: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
In-Reply-To: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749563123; l=1331;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=tIkOcJFE+rafh2MgqZmDWTromNT6mSUqQ5PDBWtf60c=;
 b=FuSWMbgkxF7ijEzeW9B9JbFHZuz/cLrnIeEaDoB8zMVARjDfERKmd8wt8S5/Wgq/izDiMzNms
 yU2NllYj5OuC2ITF6ituhkXvPBSZACsViUzQXxuCVVFdjjQAeefc0ZD
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: GfH3z2Z6IrQRiDb-BJyVbzL6YhjoiKOv
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=6848370c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: GfH3z2Z6IrQRiDb-BJyVbzL6YhjoiKOv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwOCBTYWx0ZWRfX+m0EV/cmV2fu
 qnwFAqjaN/p2XFswpejGTKxyYvfZZr0bQM7dIeq14qf0zp1SW3B/L+XoJC7HUfPAFwZ5u8p10eN
 RdjOooNu6gXQQqYNlQCQKbNA/KHHDOzvSNT6W91+2h3gvTS6YVNBDZfwrEz0yJylfiIEaJKveet
 6jaolopAAK49xv5i8CjiSR+Y9nx1LUPJcwibdU1GovjzIgCtFtK6o1L10UgFMM8dBVxnBgLOUhv
 /6hklLBgy4m9gcvNpaFEgg3YtCNN39hzRN/XHioV1+BmYFe7BHOMAHmMqlw+CywMfwjrruPcrwF
 g0nS+FMC8J7ixCKBoumW/iKDqhO6L58aUWoUxtSL7gK7YWdychkeKNTtn6LWNV1L1Cy5K9FEVzg
 Rks9+GwwSL3EaE/pF0ov282MtjI+k5hlL18b6rfshuIs/f9zlrtTPwU2xaFCSsQRSTdc7nUz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=935 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100108

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v5:
	- Rename the property 'qcom,imem' to 'sram'
Changes in v4:
	- New patch
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 7fdc003f210e5a69944b00361a16fbdf58f39801..1d5f943b3aa6be1c1bb7b74d9d44c8e1755678a4 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -485,6 +485,7 @@ watchdog@f410000 {
 			reg = <0 0x0f410000 0 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
+			sram = <&imem 0x7b0 0x5>;
 		};
 
 		qusb_phy_1: phy@71000 {
@@ -591,7 +592,7 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
-		sram@8600000 {
+		imem: sram@8600000 {
 			compatible = "qcom,ipq5424-imem", "syscon", "simple-mfd";
 			reg = <0 0x08600000 0 0x1c000>;
 			ranges = <0 0 0x08600000 0x1c000>;

-- 
2.34.1


