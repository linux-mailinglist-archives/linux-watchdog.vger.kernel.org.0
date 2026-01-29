Return-Path: <linux-watchdog+bounces-4850-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDi4LrJpe2lEEgIAu9opvQ
	(envelope-from <linux-watchdog+bounces-4850-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jan 2026 15:07:46 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5055CB0B13
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jan 2026 15:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5FA6F30058E9
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jan 2026 14:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6573B37A497;
	Thu, 29 Jan 2026 14:07:42 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6336C3081BE;
	Thu, 29 Jan 2026 14:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769695662; cv=none; b=VIEJq4oOvQFpddrBeyOgbWLzfx0q6dj3sqBXBkmECPqGhEX2X7XzQnI7i2NdU/vDNZ80DW+qZsL/1VFLr2ixLkIJeHt9M9XqheVcHLiuympgTEHTQSFd/T4UkpLTZS6T/FzV6azAf1inCIUdHC/kO24GtSC87vHB8Hd2EIyAYhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769695662; c=relaxed/simple;
	bh=j2B6oCIQlW85QfPvxgMRUkjd7ewA+gIOMHByUGvmrBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kJw2CPILtUY16dvmkGBpyq7MQ6vT0O9dOd5kCfFPAZohdO2ZQy4v62jJnzZc6MRczYNYh4a9lCy16rCGQz1mYOcyUDzLw+Xer2mR6YlLEFm+phICFHgzCt+LQl2oRqZ7fC1BNJVoqkjWi9uNc8PH/cT+wu9vNDODW3VaM7a3O8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: T+hVw0mWTBOgU8YDHgLTDw==
X-CSE-MsgGUID: uqTPQBSuTq6Qw3dQUfC7OQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 29 Jan 2026 23:07:37 +0900
Received: from mind-2s.example.org (unknown [10.226.36.118])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id C8EB041AE669;
	Thu, 29 Jan 2026 23:07:32 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Rob Herring <robh@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-clk@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH mainline-linux 0/3] Remove WDT{0,2,3} support from RZ/V2H(P)
Date: Thu, 29 Jan 2026 14:07:28 +0000
Message-ID: <20260129140731.12633-1-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,roeck-us.net,baylibre.com,linux-watchdog.org,glider.be,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-4850-lists,linux-watchdog=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-watchdog@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-watchdog,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5055CB0B13
X-Rspamd-Action: no action

Dear All,

The HW user manual states that the CA55 cores from the Renesas RZ/V2H(P)
SoC are only allowed access to WDT1, however when WDT support was added
it included all the WDT IPs (WDT0, WDT1, WDT2, and WDT3).

Address this by removing the device tree nodes and clock/reset entries
for WDT{0,2,3}.

Cheers,
Fab

Fabrizio Castro (3):
  dt-bindings: watchdog: renesas,r9a09g057-wdt: Rework example
  arm64: dts: renesas: r9a09g057: Remove wdt{0,2,3} nodes
  clk: renesas: r9a09g057: Remove entries for WDT{0,2,3}

 .../watchdog/renesas,r9a09g057-wdt.yaml       |  8 ++---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 30 -------------------
 drivers/clk/renesas/r9a09g057-cpg.c           | 15 ----------
 3 files changed, 4 insertions(+), 49 deletions(-)

-- 
2.34.1


