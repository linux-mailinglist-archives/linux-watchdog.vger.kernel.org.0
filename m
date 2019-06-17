Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31C3B47E06
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Jun 2019 11:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727847AbfFQJOK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 Jun 2019 05:14:10 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:36796 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726753AbfFQJOK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 Jun 2019 05:14:10 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C4E6525AED3;
        Mon, 17 Jun 2019 19:14:07 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C1B9994024A; Mon, 17 Jun 2019 11:14:05 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] dt-bindings: watchdog: Rename bindings documentation file
Date:   Mon, 17 Jun 2019 11:09:53 +0200
Message-Id: <20190617090953.8770-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

For consistency with the naming of (most) other documentation files for DT
bindings for Renesas IP blocks rename the Renesas WDT documentation file
from renesas-wdt.txt to renesas,wdt.txt.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 .../devicetree/bindings/watchdog/{renesas-wdt.txt => renesas,wdt.txt}     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/watchdog/{renesas-wdt.txt => renesas,wdt.txt} (100%)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas-wdt.txt b/Documentation/devicetree/bindings/watchdog/renesas,wdt.txt
similarity index 100%
rename from Documentation/devicetree/bindings/watchdog/renesas-wdt.txt
rename to Documentation/devicetree/bindings/watchdog/renesas,wdt.txt
-- 
2.11.0

