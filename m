Return-Path: <linux-watchdog+bounces-4164-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 695B3B429FF
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Sep 2025 21:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2BE21BC6CA8
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Sep 2025 19:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A490C3629AC;
	Wed,  3 Sep 2025 19:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5N2FwVO"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707782D94A2;
	Wed,  3 Sep 2025 19:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756928067; cv=none; b=ROcFcBjTHpkFmNtyBcuZTx7i2cic3QC9MsRUUxS9ox59zKeeaml335sbCLGWobiiBM+ra2I2MkSsM1LuUDmh6IAnVgXTc0q6m28PhfF+5lX/FXjWXArfBxKfvVRwD4NaR5CmCkO7aSoKww1jFa9zKPt9aLMKSGK62Xk3PVBDQLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756928067; c=relaxed/simple;
	bh=DnLt/SBMSfTZBgk5JWHNT9RMOyUX2bInZRqm44ui51g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W6uHaDFjJmXQ/hfS0xjbLz4C+iNXf/gXS0p+z9saWN8UISFp88QxTJ/8Yldms2jIfIM853Hfz/XUbpWN6yCcP5CzEP5jbpRn6sr1m05hPuBzff5ZDJMMLu+LXAob4LMkQ5GjVxmCQFdSfH8ym6CnyzD/yBcugDed97Zd1EA2/AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5N2FwVO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0148BC4CEE7;
	Wed,  3 Sep 2025 19:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756928067;
	bh=DnLt/SBMSfTZBgk5JWHNT9RMOyUX2bInZRqm44ui51g=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=l5N2FwVOOx4Ag7agp4LqOUzyk/gvZqe7/JMHLHMnLp4QQjwZkbO783EpsFXxZ2u8n
	 iSUPrj0o2osvU31x2H8sTyCq+oIwwPqk7cdvOcS3u/kK3VDkkwHW8liCsAoraoKX3f
	 Lcs5ahLhDWdjgdnFJScbvfI3prEPPzsZyMILIVy9BBYo8yZBPXv5KNocgSkBXs5i2z
	 u6nOpMV0hslZoSA0wr8KGiFoauXT7uetF5GIqT4Okxg33RzfwTHTJnzvAie8D5daon
	 GFGmA8xRReT3TdK9U+wQNo7Hb6VAkj9yhhx36MWdYsqZe3ME3o3ZyAgeY1IPYtdJB1
	 LSBhHT4BrZTZw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB8BFCA1014;
	Wed,  3 Sep 2025 19:34:26 +0000 (UTC)
From: Hrishabh Rajput via B4 Relay <devnull+hrishabh.rajput.oss.qualcomm.com@kernel.org>
Subject: [PATCH 0/2] Add support for Gunyah Watchdog
Date: Wed, 03 Sep 2025 19:33:58 +0000
Message-Id: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACaYuGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwNj3fTSvMrEjPjyxJLkjJT8dF2jFCMzE0sTY4tUI0sloK6CotS0zAq
 widGxtbUAB4BPbWEAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756928065; l=1783;
 i=hrishabh.rajput@oss.qualcomm.com; s=20250903; h=from:subject:message-id;
 bh=DnLt/SBMSfTZBgk5JWHNT9RMOyUX2bInZRqm44ui51g=;
 b=XfShsxJHzpWyLh8U+wdwsMZp+lUR39UftpyXcbGXlJCSLDWuRvECb2OHQJI4v/e7bkdo904ft
 opn6k/cpcYBBAwwkPc/Ntqekh16g1Xcy97UMuJnKkeYuFAOMfxuEqYv
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
provided by the Gunyah Hypervisor. The driver supports start/stop
operations, timeout and pretimeout configuration, pretimeout interrupt
handling and system restart via watchdog.

This series is tested on SM8750 platform.

[1]
https://lore.kernel.org/all/20240222-gunyah-v17-0-1e9da6763d38@quicinc.com/

[2]
https://github.com/quic/gunyah-hypervisor

Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
---
Hrishabh Rajput (2):
      dt-bindings: Add binding for gunyah watchdog
      watchdog: Add driver for Gunyah Watchdog

 .../bindings/watchdog/qcom,gh-watchdog.yaml        |  76 ++++++
 MAINTAINERS                                        |   3 +
 drivers/watchdog/Kconfig                           |  13 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/gunyah_wdt.c                      | 268 +++++++++++++++++++++
 include/linux/gunyah_errno.h                       |  77 ++++++
 6 files changed, 438 insertions(+)
---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250903-gunyah_watchdog-2d2649438e29

Best regards,
-- 
Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>



