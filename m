Return-Path: <linux-watchdog+bounces-4532-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 978BBC412AE
	for <lists+linux-watchdog@lfdr.de>; Fri, 07 Nov 2025 18:55:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E03E18878BF
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Nov 2025 17:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8D5337B9D;
	Fri,  7 Nov 2025 17:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lz38zz6o"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DC230F953;
	Fri,  7 Nov 2025 17:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762538128; cv=none; b=Feaw8vWKy+sKNj1PxVJ4T3NsM2Tc4VK7H8mXHMSa6ZI7v2mJdIIFDATRU0403GD1NQfZ03ipgOT6RHSZfKxNEDWOnY8PQAVrdPasjz3nx/zc5FZIkfSj1aLy825xzxAQ6kanMS3eizVFewD6rgQG5/v6QJdOlOb9lqh6z+8DPXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762538128; c=relaxed/simple;
	bh=VB5qSlycJ1xv2kxhWS0fvVrQnEJ9N2tIdKB1+gXnfe8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bnUOuowNEBs0Z7D+LY7ppdrl77WIAQfmAc8/YMxPUpqjOO35O/UIwp5TmSu4fCR86iFzaUDvS2yU6kSmeDUWQiGq4Jx5MC0kq03I0rE1Kcu3hwt5C/nMgVsv/5dDizby4XdUCSWvD7XVrazuy8F1Y/67W/oi9/BGw+ow7HPn0G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lz38zz6o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E324C116B1;
	Fri,  7 Nov 2025 17:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762538128;
	bh=VB5qSlycJ1xv2kxhWS0fvVrQnEJ9N2tIdKB1+gXnfe8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=lz38zz6oCuFFih0Wrll6SVj6LWY66jALBaKZRDd3itpE4PHiiCu6V22op+UKZT0qa
	 zirlJD8iVmC8G98jSNASC48dw2vop0znpdtTgQtzzCbeOpGtCWn0ctz7r8QPpHjMCe
	 MQt7g6SaporYt64gUwsOF44tcXsMG6NrASespbq6ccfv/XbA8jSuvkz9NBMtZzBTXE
	 yoZUVKb6hktgcWAyNPGISHdhbZ5gZEqjMkXachXkme4ck1ZbLHiJhq2JioXk3vNpzN
	 a8hEnHHmzyfKcDj1ddfnp2Vnv+wj4zmX3wcAsZy7ECYWK6MbQWYh3T0bVNXP79gPQU
	 tkyuWkxUE1rDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF89CCF9E3;
	Fri,  7 Nov 2025 17:55:28 +0000 (UTC)
From: Hrishabh Rajput via B4 Relay <devnull+hrishabh.rajput.oss.qualcomm.com@kernel.org>
Subject: [PATCH v5 0/2] Add support for Gunyah Watchdog
Date: Fri, 07 Nov 2025 17:53:07 +0000
Message-Id: <20251107-gunyah_watchdog-v5-0-4c6e3fb6eb17@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAMyDmkC/3XPTQrCMBAF4KtI1kZm8lONK+8hIkkztgFttKlVk
 d7d6EKE2s3AG5hveE+WqA2U2Hr2ZC31IYXY5KDnM1bWtqmIB58zEyA0GJC8ujYPW+9vtitrHys
 uvCiUUXJFwrB8dW7pEO4fcbvLuQ6pi+3j86DH93ba6pEDl5YKA1oCKbeJKS0uV3ss4+m0yIO9y
 V58GQQoxozgyJ0xXqFXWmmYYOQPI1ZjRmaGCo9kcz2HfoJRP4zEMaNyqaV1DokQJeo/zDAML0r
 N582KAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762538126; l=3759;
 i=hrishabh.rajput@oss.qualcomm.com; s=20250903; h=from:subject:message-id;
 bh=VB5qSlycJ1xv2kxhWS0fvVrQnEJ9N2tIdKB1+gXnfe8=;
 b=3k6N+32LYDEVowZoypq0M3N3S9wDX2MtcFeBkozLMzdqwEQIVqpn7hxg+dnJVol8HLefC88yG
 8xtYLtKz/ofCJLDQTcmL12FMOBlqPsJQjRiKPnbxkJRUFp6dYd5ZTFK
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
 drivers/firmware/qcom/qcom_scm.c |  51 ++++++++
 drivers/watchdog/Kconfig         |  13 ++
 drivers/watchdog/Makefile        |   1 +
 drivers/watchdog/gunyah_wdt.c    | 260 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 326 insertions(+)
---
base-commit: 6146a0f1dfae5d37442a9ddcba012add260bceb0
change-id: 20250903-gunyah_watchdog-2d2649438e29

Best regards,
-- 
Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>



