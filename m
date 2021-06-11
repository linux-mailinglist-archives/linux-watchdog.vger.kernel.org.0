Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C461C3A49E8
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Jun 2021 22:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbhFKUKR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 11 Jun 2021 16:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbhFKUKQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 11 Jun 2021 16:10:16 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53130C061574;
        Fri, 11 Jun 2021 13:08:18 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id z8so7251665wrp.12;
        Fri, 11 Jun 2021 13:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tzxiu7KFGSluOPtUekhY+72u7lbVVCqQQlsEwyNj1Qg=;
        b=vROX4jNiaWGHijnOjfKBo6d3pqx42H+5qGdwurRLD7O4fPmDhIObwlDUtzfLG0SLPX
         IP3T74La8bnvi5+gAlLEjRAqSXP6pwRoLT18wH2ix+Uv8xNtvhZshrq7iTepo78ZXJgB
         d+PYhb9GC2VESBbumysCwNWeDs9yOOSiYKcc1O0lpDpGwz6I/iWEl42IYnML8PRSLGjK
         iVDNJcWsoyBknsHj5yeEi4/mRhVE7up5FUHOY9fYATHd6RYSNURnyheHWe8+Iqmlzgwt
         tfrRefoW/3Vevrj2/glIm6DDo/KIZiRruGZmC2yqZh44/vcR6uhFsgBGTKer5t9/uCNr
         mgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tzxiu7KFGSluOPtUekhY+72u7lbVVCqQQlsEwyNj1Qg=;
        b=cIlG9jFEiPe27zCkZvxyG2oeG3Ib+tmPU+COkSNus+i9H7rh7OP0QFIA9lGutkQ53V
         qaIXCM0/a9PFAjG3wUj4b6kbQvs0roItwQDTUK5GWlfwEdqgmwJBY7PpdXKsJY8sKstQ
         QfTe8R6McF1RcQ9tD8/J79jf3KlacZ2Vq0aYCXOHZBtQX4R1M139Yc92PiNEIT5m+qut
         Ig+fLkO4E+xovSst5ok6cbLO6DCUzLGkcJ0go+Dp9wydIGHpBMo7rMCjeunSCzOanCrH
         FDI2uxShTkwznebY6qqX5J4+b6MubaDOc1/ZzncHnLtjeOyo7tEqeId3MKuyyoC6MCNg
         8RJw==
X-Gm-Message-State: AOAM530vo0Zuw1fTCTKUjyZOoYadJrcydnCGYPTzefz+qmvGRxuAXQCU
        SqPAlZ0BrVLdOyX/51DbwmYZoVMynCE=
X-Google-Smtp-Source: ABdhPJygC3PA0tq7FMN68+kal30TbfxTd8WdXPm5eg88bWh3p2DjciczPD3JHFYt0GkINaM3gpDTMg==
X-Received: by 2002:a5d:4fc6:: with SMTP id h6mr5973499wrw.1.1623442093463;
        Fri, 11 Jun 2021 13:08:13 -0700 (PDT)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
        by smtp.gmail.com with ESMTPSA id u20sm6741319wmq.24.2021.06.11.13.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 13:08:13 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] ARM: dts: mstar: Add watchdog device_node definition
Date:   Fri, 11 Jun 2021 22:08:01 +0200
Message-Id: <20210611200801.52139-4-romain.perier@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210611200801.52139-1-romain.perier@gmail.com>
References: <20210611200801.52139-1-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This adds the definition of both an oscillator at 12Mhz required by the
the watchdog and the watchdog device_node.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
---
 arch/arm/boot/dts/mstar-v7.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index 075d583d6f40..2273295e140f 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -60,6 +60,14 @@ rtc_xtal: rtc_xtal {
 			clock-frequency = <32768>;
 			status = "disabled";
 		};
+
+		xtal_div2: xtal_div2 {
+			#clock-cells = <0>;
+			compatible = "fixed-factor-clock";
+			clocks = <&xtal>;
+			clock-div = <2>;
+			clock-mult = <1>;
+		};
 	};
 
 	soc: soc {
@@ -101,6 +109,12 @@ reboot {
 				mask = <0x79>;
 			};
 
+			watchdog@6000 {
+				compatible = "mstar,msc313e-wdt";
+				reg = <0x6000 0x1f>;
+				clocks = <&xtal_div2>;
+			};
+
 			intc_fiq: interrupt-controller@201310 {
 				compatible = "mstar,mst-intc";
 				reg = <0x201310 0x40>;
-- 
2.30.2

