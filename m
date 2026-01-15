Return-Path: <linux-watchdog+bounces-4818-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DB0D23121
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Jan 2026 09:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A6113016983
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Jan 2026 08:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0431A2877D4;
	Thu, 15 Jan 2026 08:17:54 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959452E11A6;
	Thu, 15 Jan 2026 08:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768465073; cv=none; b=cpeBo0TWS3dUR764gktUHbZx5LMRk9C93/tnxSgkBR2eoHD0osQ9TehqIVDnWSd/Tk2BHgxlD2obM4AIwyApjgs7rYhWdJxEUYszSIY7vPd0FBVwr25aY5eb2eX4aFlCtbDCIl9HO1ofv0k3elyzRkX+lWPQ1YRe7amjKPZo0x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768465073; c=relaxed/simple;
	bh=f7DoDK8YktICt95JRDktRPwcZqr50IqTbI4V9CCKlM4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Z9XxRT38iRkbcmreE0ggDzkln3rxxVEy/+8P8sg21EyeD2fTZJfvYMrrKrgc75EcPYbP5fmIYKRqQbbOxSeu/4cnpoa8x+4vVjM0BWqIdG+dIfu7qkeOwK8rFI+fLv68GSmtZXUWwP0UNO/994C0L3SooRV0fXZG++qgPpgyEr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 60F8FEvm082627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Thu, 15 Jan 2026 16:15:14 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 Jan
 2026 16:15:13 +0800
From: CL Wang <cl634@andestech.com>
To: <cl634@andestech.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <tim609@andestech.com>
Subject: [PATCH v2 0/3] watchdog: Add support for Andes ATCWDT200
Date: Thu, 15 Jan 2026 16:14:41 +0800
Message-ID: <20260115081444.2452357-1-cl634@andestech.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 60F8FEvm082627

This series adds support for the Andes ATCWDT200 watchdog timer.

The driver integrates with the Linux watchdog framework and supports:
  - Basic watchdog operations (start, stop, ping, set_timeout).
  - Programmable reset and interrupt intervals.
  - Automatic detection of the supported interrupt timer bit-width.
  - System reset via the watchdog restart handler.

Changes in v2:
  - dt-bindings:
    - Drop redundant text "including supported properties..." from the
      commit message.
    - Clarify the relationship between ATCWDT200 IP and SoCs (AE350/Qilai)
      in the commit message.
    - Add missing type definition ($ref: uint32), enum constraint, and
      description for 'andestech,clock-source' property. 
  - watchdog: atcwdt200:
    - Use devm_clk_get_enabled() instead of devm_clk_get() and
      clk_prepare_enable()
    - Drop unnecessary "andestech,qilai-wdt" compatible
    - Remove .owner assignment from platform_driver
    - Simplify resume error handling

CL Wang (3):
  dt-bindings: watchdog: Add support for Andes ATCWDT200
  watchdog: atcwdt200: Add driver for Andes ATCWDT200
  MAINTAINERS: Add entry for Andes ATCWDT200

 .../watchdog/andestech,ae350-wdt.yaml         |  53 ++
 MAINTAINERS                                   |   6 +
 drivers/watchdog/Kconfig                      |   9 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/atcwdt200_wdt.c              | 580 ++++++++++++++++++
 5 files changed, 649 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/andestech,ae350-wdt.yaml
 create mode 100644 drivers/watchdog/atcwdt200_wdt.c

-- 
2.34.1


