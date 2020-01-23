Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1AF5146AD2
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 Jan 2020 15:06:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729184AbgAWOF7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 Jan 2020 09:05:59 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38575 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbgAWOF6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 Jan 2020 09:05:58 -0500
Received: by mail-wm1-f65.google.com with SMTP id u2so2673733wmc.3
        for <linux-watchdog@vger.kernel.org>; Thu, 23 Jan 2020 06:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V+m1nJWWvTVfrYpy4Izvkq8pYu8rPqVhh5Al/ro5fb0=;
        b=pILlYuF9oaFcy6CanCHJqX//BqrXE3NRIyb2I+buwx9Z3GdGNiWorB/ZxmMkw/thjX
         e5/+d0tdedK74h7MmH7qdm97P9zK8VWxIaahjpIObWzf2Pq5HE9KBnEREkj9dJoz2eVQ
         dKrNJRpQ2H958YRumzKwf+4kQfjD8sqia3Sk3XByoCj3YKV1kAeVa52uRj8cL7HiVvMt
         kyFOvY49UfDyb2RBkMWQAlBZXPNNnq2quUW7t0kYNhZM9s4UzM/V0DozMrcdpVg3odAJ
         dUzZY1dYhup6SS+vpPAALpgOZy3lXcpbp1Nq8WZbbXVTuOUYu/ILsnCmcWNspEiOoVdD
         D/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V+m1nJWWvTVfrYpy4Izvkq8pYu8rPqVhh5Al/ro5fb0=;
        b=VTGlfpyFOg78pq7KPnL6YorINgYXVcM5bGBkKqcg+we8vuBsnVuYm5OgK7KX1ZhY6S
         iaxqx3k0AXudYFQBORNg21gWRFwwxh7smDzTG+hAGla1svLLa/3wgW5yyww4eM62IDFU
         uopFqnly2proWa7yJkAKtIPhiqQKp7sM73GNUtp5ZzgX8AN/ZqaC3YXinnv80MLy8mgn
         w0dF/lH4QFrTlAjCZKXbraHU27aCnec5FPIpuONkrf2O1Kb8hNh9/rrEyej02I0rEaHy
         EsjA6+rMCs0mWxu7DQO/kpIAp609rlgCKKQtno2xpeyjOMjGouQHEEXhH7RTBSahMidN
         AvYw==
X-Gm-Message-State: APjAAAWXAf17lzmq7n/Akp4DOf0WA504Qi6rGfrPLv4l+PzIPDsV6tqH
        ySl0JNfp+GJcjN8q1S4SiAS1vBm92jtJ2g==
X-Google-Smtp-Source: APXvYqw4uiS6zU2y3hT8bQZeDM+L52C3cwNMfgZIbHPn+mK5BTFQSbjUi3ALH0pt5fBgNNYQdwBxrA==
X-Received: by 2002:a7b:c00c:: with SMTP id c12mr4533425wmb.174.1579788349813;
        Thu, 23 Jan 2020 06:05:49 -0800 (PST)
Received: from vpr-vm.corporate.saft.org (mey38-h01-176-145-72-80.dsl.sta.abo.bbox.fr. [176.145.72.80])
        by smtp.gmail.com with ESMTPSA id l19sm2760976wmj.12.2020.01.23.06.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 06:05:49 -0800 (PST)
From:   Vincent Prince <vincent.prince.fr@gmail.com>
To:     linux-watchdog@vger.kernel.org, linux@roeck-us.net,
        wim@linux-watchdog.org
Cc:     Vincent Prince <Vincent.PRINCE.fr@gmail.com>
Subject: [PATCH] watchdog: it87_wdt: add IT8786 ID
Date:   Thu, 23 Jan 2020 15:05:44 +0100
Message-Id: <20200123140544.25937-1-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Vincent Prince <Vincent.PRINCE.fr@gmail.com>

IT8786 watchdog works as in IT872x

Tested on VECOW ECS-9000 board.

Signed-off-by: Vincent Prince <Vincent.PRINCE.fr@gmail.com>
---
 drivers/watchdog/it87_wdt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
index a4b71ebc8cab..f3bf3ea50e39 100644
--- a/drivers/watchdog/it87_wdt.c
+++ b/drivers/watchdog/it87_wdt.c
@@ -67,6 +67,7 @@
 #define IT8726_ID	0x8726	/* the data sheet suggest wrongly 0x8716 */
 #define IT8728_ID	0x8728
 #define IT8783_ID	0x8783
+#define IT8786_ID	0x8786
 
 /* GPIO Configuration Registers LDN=0x07 */
 #define WDTCTRL		0x71
@@ -294,6 +295,7 @@ static int __init it87_wdt_init(void)
 	case IT8721_ID:
 	case IT8728_ID:
 	case IT8783_ID:
+	case IT8786_ID:
 		max_units = 65535;
 		break;
 	case IT8705_ID:
-- 
2.24.0

