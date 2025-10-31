Return-Path: <linux-watchdog+bounces-4486-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB9EC246BE
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Oct 2025 11:22:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 028404F201A
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Oct 2025 10:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D0033F8CA;
	Fri, 31 Oct 2025 10:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XscP88ph"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968FA33E350;
	Fri, 31 Oct 2025 10:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761906075; cv=none; b=ijlbKsdhHaEQvDDq1iVFxzeZ3iFbzad4G2XouPyqsBHoljmAXWsjeQg0ATfl/jV8SJwZ7Ghy0MpgFlfStWDrIwMBeEG9nmM96CQG4xFpkGE5pY3IP2tq0vcBSdYJ7qB7smZBJ2TNVIyr6m8n4tofiCb6vuBZ3Ii3l8rRksx7bgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761906075; c=relaxed/simple;
	bh=acn91U54LoPQMMs8xoiZSrTiOMoYJO9PhIpHKdmkwoM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J4UFYxxuZF21/RljPwJHQXtmw0ZHsGMyncSBBaG6BhZ2fHnaFLAt/WW2odWStTdN5YjBhg5qexdZA+fSytQYJmC4DLz94Jb0Y3KIvz1nmx51sF+Fw5mIDaFtE3R3hEaXjLA2VceD5E4IhgJDRFsaKfq7NXNLDjvNsbxYqFPn1L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XscP88ph; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FD41C4CEE7;
	Fri, 31 Oct 2025 10:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761906075;
	bh=acn91U54LoPQMMs8xoiZSrTiOMoYJO9PhIpHKdmkwoM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=XscP88phpNfS4k5699F4zwNn76u0D3XYzR742Y5rSB47F2y9TvhTyvN8RZ4eu9Cz9
	 GtdyGMl5ZvLXnZ1UwO8lL03hwBky6X2VEXLBjyREp41VjYF2bZDxBVh57jEidwcNUZ
	 kBAvUt6nyK35UHnorNCMI/IxsAQHBpEz5q/IrT97td89oZTJwTn+Osox3fKVldW0OJ
	 FtB05bqJEusATb4Y1ez+7ZpXl0MVOqOjlKBeZmaWWW/deGWdDHKDJM+KbwQ7NYhdP4
	 2v3UgzGXTK6Tm4cjiL5it2ChYubzLceqDoqzrWJK4uS0cYL//YgbPW7IVa8PSuKSFy
	 ra6fsXOMUsVXw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A88ACCF9FE;
	Fri, 31 Oct 2025 10:21:15 +0000 (UTC)
From: Hrishabh Rajput via B4 Relay <devnull+hrishabh.rajput.oss.qualcomm.com@kernel.org>
Subject: [PATCH v4 0/2] Add support for Gunyah Watchdog
Date: Fri, 31 Oct 2025 10:18:12 +0000
Message-Id: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOSMBGkC/3XPTQqDMBAF4KtI1o1MfhTTVe9RSolmqoFqWqO2I
 t690UUpWDcDb+B9w0zEY2vRk2M0kRYH661rQpCHiBSVbkqk1oRMOPAEFAha9s2oq+tLd0VlXEm
 54alUUmTIFQmtR4s3+17F8yXkyvrOteN6YGDLdt8aGAUqNKYKEgEo85PzPn72+l64uo7DIAs58
 C/DANItwymjuVJGMiMTmcAOI34Ynm0ZERhMDUMd3suZ+cPM8/wB4e0TOUMBAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761906073; l=3387;
 i=hrishabh.rajput@oss.qualcomm.com; s=20250903; h=from:subject:message-id;
 bh=acn91U54LoPQMMs8xoiZSrTiOMoYJO9PhIpHKdmkwoM=;
 b=CwgQim5PY7Ls6s+OyZ5Ux3KurdQGoNnBd4uhwbVzoWN6aJ53nJaD/E9VIOR2f+T9z/rDWeagV
 bCSaMaypllnD/eOew5BNZtCoDf6O4jopKNE2BDSjsKl+lsjU7/VxMFm
X-Developer-Key: i=hrishabh.rajput@oss.qualcomm.com; a=ed25519;
 pk=syafMitrjr3b/OYAtA2Im06AUb3fxZY2vJ/t4iCPmgw=
X-Endpoint-Received: by B4 Relay for
 hrishabh.rajput@oss.qualcomm.com/20250903 with auth_id=509
X-Original-From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
Reply-To: hrishabh.rajput@oss.qualcomm.com

Gunyah is a Type-I hypervisor which was introduced in the patch series
[1]. It is an open source hypervisor. The source repo is available at
[2].

The Gunyah Hypervisor doesn't allow its Virtual Machines to directly
access the MMIO watchdog. It either provides the fully emulated MMIO
based watchdog interface or the SMC-based watchdog interface depending
on the hypervisor configuration.
The SMC-based watchdog follows ARM's SMC Calling Convention (SMCCC)
version 1.1 and uses Vendor Specific Hypervisor Service Calls space.

This patch series adds support for the SMC-based watchdog interface
provided by the Gunyah Hypervisor.

This series is tested on SM8750 platform.

[1]
https://lore.kernel.org/all/20240222-gunyah-v17-0-1e9da6763d38@quicinc.com/

[2]
https://github.com/quic/gunyah-hypervisor

Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
---
Changes in v4:
- Move the contents of gunyah_wdt_init() to qcom_smem_probe() to make
  sure we're registering the watchdog only on the Qualcomm devices.
- Link to v3: https://lore.kernel.org/r/20251028-gunyah_watchdog-v3-1-e6d1ea438b1d@oss.qualcomm.com

Changes in v3:
- Move back to platform driver model. In module init, determine if we're
  running on a Qualcomm device and there is no supported memory-mapped
  watchdog present. Then proceed to register platform device and driver
  for SMC-based Gunyah watchdog.
- To determine if we're running on a Qualcomm device we're checking the
  presence of "qcom,smem" compatible devicetree node. As an alternative,
  we also tried using socinfo for the same purpose. When both
  gunyah_wdt and socinfo drivers were made built-in, it couldn't be
  ensured that the socinfo driver probed successfully before gunyah_wdt
  init was called. Hence, we resorted to the devicetree node approach.
- Limit the errors listed in gunyah_error to the ones that can be
  produced by the driver.
- Link to v2: https://lore.kernel.org/r/20251006-gunyah_watchdog-v2-1-b99d41d45450@oss.qualcomm.com

Changes in v2:
- Move away from platform driver model since the devicetree overlay does
  not happen by default.
  See https://lore.kernel.org/all/91002189-9d9e-48a2-8424-c42705fed3f8@quicinc.com/
- Only when MMIO-based watchdog device is absent in the devicetree,
  proceed to detect SMC-based watchdog using GUNYAH_WDT_STATUS SMC and
  initialize if SMC returns success.
- Implement pm notifiers as gunyah_wdt is no longer a platform driver so
  dev_pm_ops cannot be used.
- Pretimeout IRQ is no longer supported.
- Remove struct gunyah_wdt since it is not required.
- Move the contents of gunyah_errno.h to gunyah_wdt.c.
- Link to v1: https://lore.kernel.org/r/20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com

---
Hrishabh Rajput (2):
      soc: qcom: smem: Register gunyah watchdog device
      watchdog: Add driver for Gunyah Watchdog

 MAINTAINERS                   |   1 +
 drivers/soc/qcom/smem.c       |  37 +++++++
 drivers/watchdog/Kconfig      |  14 +++
 drivers/watchdog/Makefile     |   1 +
 drivers/watchdog/gunyah_wdt.c | 249 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 302 insertions(+)
---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250903-gunyah_watchdog-2d2649438e29

Best regards,
-- 
Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>



