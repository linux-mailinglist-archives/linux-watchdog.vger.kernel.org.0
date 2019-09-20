Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68C02B9537
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Sep 2019 18:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405443AbfITQVn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 20 Sep 2019 12:21:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:40122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405433AbfITQVn (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 20 Sep 2019 12:21:43 -0400
Received: from localhost.localdomain (unknown [194.230.155.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0D4BB218AE;
        Fri, 20 Sep 2019 16:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568996502;
        bh=lj7T3kTvphhZDzZZ9VayMSkoBtQCOWfhYBk4KfxHg50=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wW63Fcj6lhiCHAAQ3qQvBNpuB524I5PssySEdWtT/9BPu39PT+9aqVD3ijxpxk9FJ
         98Y0pifE0or9ZRF4g8VvjzXa096CeFEweNiXIkCcXZeCBm9X3LXkexu6CpmpHRI/F5
         fHwSsEgKU3FXPynRyLmUQ4/miqcvEhVzkMhkA4SY=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 3/3] dt-bindings: watchdog: meson-gxbb-wdt: Include generic watchdog bindings
Date:   Fri, 20 Sep 2019 18:21:24 +0200
Message-Id: <20190920162124.7036-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920162124.7036-1-krzk@kernel.org>
References: <20190920162124.7036-1-krzk@kernel.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Include generic watchdog DT schema bindings in Amlogic GXBB Watchdog
bindings.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
index d7352f709b37..4ddae6feef3b 100644
--- a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
@@ -10,6 +10,9 @@ title: Meson GXBB SoCs Watchdog timer
 maintainers:
   - Neil Armstrong <narmstrong@baylibre.com>
 
+allOf:
+  - $ref: watchdog.yaml#
+
 properties:
   compatible:
     enum:
-- 
2.17.1

