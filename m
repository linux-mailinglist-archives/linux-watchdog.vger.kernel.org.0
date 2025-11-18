Return-Path: <linux-watchdog+bounces-4611-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B212C68E76
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Nov 2025 11:48:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3ADE6345F22
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Nov 2025 10:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5707C34E768;
	Tue, 18 Nov 2025 10:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r0J5oQbX"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CD634DCC0;
	Tue, 18 Nov 2025 10:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763462689; cv=none; b=K2qh7cZ4L3P6hbWsfOgS9JP6Wyjr7b41kDeTUe7elWPoOnieoVcMZCzHDO69q9PWH86TQItFJAh3ogs07UKJqsdBtg/jerFEB9UT55+l2iPDh9zlkT04EF5LNTAA9f/ZQCvszwzLfHI+oMKwCS7+toYQOsjfyNGesr7psc+eHyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763462689; c=relaxed/simple;
	bh=87/vpDwlH+YaZKfQww7cWIuqIUCKN9obYeSsNRg1vIg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MG/7Q3y2ApuPIFKjpV+pLIX7maAYXnyJ7Bxo+fCgVrE7lOkI9sFCb8hyg22LMufXwrah1p4WpZ0ICuJAILxujubbjZj7OXdpymBdu47i9IY+yO6E5QiEcoUn6zI2B9W4sMwmSgG1Mi147NvK/sTsSohpmNMIqn+fWQ/31GmzEPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r0J5oQbX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39D23C116B1;
	Tue, 18 Nov 2025 10:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763462687;
	bh=87/vpDwlH+YaZKfQww7cWIuqIUCKN9obYeSsNRg1vIg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=r0J5oQbXeC9fvQCJWLvyRNFzsxVjIIDOZKo+0k1umc+Wd+qXJipgIn48tEm8ZWGT4
	 /YxJFYmMVNPoWFmnF4k0AompyN/5Y3zValZH79Ofzw2zxMSRmX5ZapggwarAZdBcvK
	 kFTSTbC48HQI97xzYZimufUWiZEdA1dEmPWsyrp0HjxZTU/+LsXjUz8ra3TR4dfwMq
	 Dy7cV2ybbEW0Qbtg/Rsz4nsUv8jxa+GN2nvqU//9/xBkcpIR+Gc4dcSpPwttEnTmpc
	 jJZvReR5GKu7AMZE/McMRclA6qCGcwlVU3e0CRSPfAWNO/p3d+niv27i9ND3QwYEQy
	 /vRHXyGHQzK0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 956DBCED255;
	Tue, 18 Nov 2025 10:44:46 +0000 (UTC)
From: Hrishabh Rajput via B4 Relay <devnull+hrishabh.rajput.oss.qualcomm.com@kernel.org>
Subject: [PATCH v8 0/2] Add support for Gunyah Watchdog
Date: Tue, 18 Nov 2025 10:40:55 +0000
Message-Id: <20251118-gunyah_watchdog-v8-0-e5de12e2eef5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADdNHGkC/3XQS2rDMBQF0K0Ejaugp5+tjLqPUoo+z7agsVsrc
 RuC9145g9agaiK4Ah1x750knCMmcjrcyYxLTHEac2ifDsQPduyRxpAz4YwrZpig/XW82eHty17
 8EKae8sC1NFK0yA3Jrz5m7OL3Q3x5zXmI6TLNt8cHC2y3dWsByqiwqA1TgqF0z1NKx8+rfffT+
 XzMB9nIhf8ywJguGU6BOmOChCCVVKzCiB3D25IRmUEdAG2u5yBUGLljBJSMzKUa6xwgAghQFUb
 9McCaklGZkV6j6JxGB02F0TsGeMnobeLWBgZdG6yvbdPsGVkyTWY65UEpZ/LM/5Va1/UHin+gX
 F8CAAA=
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
 Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>, 
 Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763462685; l=4630;
 i=hrishabh.rajput@oss.qualcomm.com; s=20250903; h=from:subject:message-id;
 bh=87/vpDwlH+YaZKfQww7cWIuqIUCKN9obYeSsNRg1vIg=;
 b=aNHdsxZoKjqIJUy5c8NUUwOmO0Qneij1cL1fy2O0hMhYdsVRqYDXzbP9C+lnwgSK2W6NXwLhM
 wm1pig/f1WgBQTJ/sm8z71rRmZ5g8Jpu/rPrUsUXK2z16Ndhh3PDMyy
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
Changes in v8:
- Fix error handling in gunyah_wdt_probe() to fail silently with -ENODEV
  if WDT_STATUS call returns -EOPNOTSUPP, indicating support for Gunyah
  watchdog is not present. Fail with logs for other errors.
- Link to v7: https://lore.kernel.org/r/20251114-gunyah_watchdog-v7-0-f5c155b941d5@oss.qualcomm.com

Changes in v7:
- Convert local `const` arrays to `static const` to optimize
  initialization and stack allocation.
- Link to v6: https://lore.kernel.org/r/20251112-gunyah_watchdog-v6-0-38ad01f8dac0@oss.qualcomm.com

Changes in v6:
- Fix build issues reported by the kernel test robot on PowerPC and RISC-V
  architectures by adding IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY) check
  before calling arm_smccc_hypervisor_has_uuid().
- Link to v5: https://lore.kernel.org/r/20251107-gunyah_watchdog-v5-0-4c6e3fb6eb17@oss.qualcomm.com

Changes in v5:
- Move the gunyah_wdt device registration from the SMEM driver to the
  SCM driver. Add additional logic to check if we're running under the
  Gunyah Hypervisor.
- Implement .remove() for gunyah_wdt driver to make it not persistent.
- Link to v4: https://lore.kernel.org/r/20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com

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
      firmware: qcom: scm: Register gunyah watchdog device
      watchdog: Add driver for Gunyah Watchdog

 MAINTAINERS                      |   1 +
 drivers/firmware/qcom/qcom_scm.c |  53 ++++++++
 drivers/watchdog/Kconfig         |  13 ++
 drivers/watchdog/Makefile        |   1 +
 drivers/watchdog/gunyah_wdt.c    | 261 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 329 insertions(+)
---
base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
change-id: 20250903-gunyah_watchdog-2d2649438e29

Best regards,
-- 
Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>



