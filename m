Return-Path: <linux-watchdog+bounces-4762-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50760CFF171
	for <lists+linux-watchdog@lfdr.de>; Wed, 07 Jan 2026 18:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1187318D685
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Jan 2026 16:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9D936B042;
	Wed,  7 Jan 2026 15:17:10 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9396366DDF;
	Wed,  7 Jan 2026 15:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767799030; cv=none; b=PJaVhjrmYW7eTVfQBVSiweUz2Kbn4ooNxk2ZfQwSMPbmF2toJPuf36mSfpTaoOBm1xQnXxyHaxMxtVjnrrkSiSuEh7zDAC3IYACljG1R0zQ79+ctJYigH47rJ7OWMqczBqpV84WtluNxhDM/M9zszMQqHVuTttnsF/iky54mXOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767799030; c=relaxed/simple;
	bh=UygkGUtGPBUv7Vv5D6Hq5bIJMI/XhnyFKu9OaVbLbwI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lN8aBUxiiagOc0IbiZupzIVRF5Jbcm0+NvV0ii6tANagX7waABX53ld062oX8L2rawuh30g+O8oQkA/bpE21E7dh2GrDw982fBEax5kor05AeqEhRruyromcHjNmFIrsMhnacq6kG9wC6q1mXk123QCNJqEZewK5dmslzIT8oYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 607Eqga7083234;
	Wed, 7 Jan 2026 22:52:42 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 607Ep5vR082628
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Wed, 7 Jan 2026 22:51:05 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Jan
 2026 22:51:05 +0800
From: CL Wang <cl634@andestech.com>
To: <cl634@andestech.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <tim609@andestech.com>
Subject: [PATCH 0/3] watchdog: Add support for Andes ATCWDT200
Date: Wed, 7 Jan 2026 22:50:54 +0800
Message-ID: <20260107145058.213334-1-cl634@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 607Eqga7083234

This series adds support for the Andes ATCWDT200 watchdog timer.

The driver integrates with the Linux watchdog framework and supports:
  - Basic watchdog operations (start, stop, ping, set_timeout).
  - Programmable reset and interrupt intervals.
  - Automatic detection of the supported interrupt timer bit-width.
  - System reset via the watchdog restart handler.

CL Wang (3):
  dt-bindings: watchdog: Add support for Andes ATCWDT200
  watchdog: atcwdt200: Add driver for Andes ATCWDT200
  MAINTAINERS: Add entry for Andes ATCWDT200

 .../watchdog/andestech,ae350-wdt.yaml         |  48 ++
 MAINTAINERS                                   |   6 +
 drivers/watchdog/Kconfig                      |   9 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/atcwdt200_wdt.c              | 596 ++++++++++++++++++
 5 files changed, 660 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/andestech,ae350-wdt.yaml
 create mode 100644 drivers/watchdog/atcwdt200_wdt.c

-- 
2.34.1


