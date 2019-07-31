Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6967CAC7
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Jul 2019 19:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729196AbfGaRnS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 31 Jul 2019 13:43:18 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40342 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727571AbfGaRnF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 31 Jul 2019 13:43:05 -0400
Received: by mail-pg1-f195.google.com with SMTP id w10so32408382pgj.7;
        Wed, 31 Jul 2019 10:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cpujuh1ZR9rlNCezYBnwej7X6RImv6OA33MLjjo+nmw=;
        b=UOkNfQv1O2Gs2RI9Br/pIeBvWpb5MbI7oGm8try41ElbbiEQuiZh14isJekmD5A4sc
         rx7UVhhAfsqmlL3Kx49PGwrhEF2ok6ydS99DW03jDQFb1v5L3pd9qqRMJJaG6xQMHput
         VRULMPVa62qw5P8GcgPwCWEAIIetoeRNEYRqlkq6TRF5E1CMjT6Czj8OWScUNLfadJFl
         RhBLqsPgbM7NRBOJ+XIV3R47N+tPlF+LHN1yb+EEWx2t1KQZ75kOGrNvhQ0lHe18q69x
         VhxyEDgdg0Qz8r9nnbKPFAIaFbs+j6ftLyQwyPOAnTF839+v1+/qgsYyIo9OgHGYWkDx
         RiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cpujuh1ZR9rlNCezYBnwej7X6RImv6OA33MLjjo+nmw=;
        b=Q8Bsw2Hv4cIsndbn2Xod0twVGwPekRsIPNx/ACNjz3mf2tpUx1T2kwB3eOPZ3UxZEO
         kc5oej2JEKwsYrg13pQ9fUiwo/HXtiKXi5b02I4GC8caX9pD7cURGR22bJtLHwZqkwbY
         a9PBibXIbtvprVXCNYRXbyRUaKIh6dM5+Mmdis9x+oXaIxChAJCEX2ckEaGIByagn2am
         3jVIUVFNC+KlIx8MODt5tPYsXme/du/Twncq5hDZsb8WlortFC4MHwdKM3TUujOaozvd
         9r2YWharPVAxhkdACwjLg6i3z3dUSk/sHcLwb3E7txfsC+uF90nt5i19SWG2jnVwCVwt
         cJwQ==
X-Gm-Message-State: APjAAAUptp/8c9t5yJpU09QYBfmAQPejPKZ8eyiBngz5GNlcvryv+tHL
        PEcZ7FDubhTZeY9/3T5EB6Eq3UHV
X-Google-Smtp-Source: APXvYqyk2h4seKn5/mzLa7JMMKFrbJjUhAi4IWsEUgC/qHW6HwO1rvdGWF4IPNcrvfGJ4suzYmK5pg==
X-Received: by 2002:a65:5144:: with SMTP id g4mr62535446pgq.202.1564594984189;
        Wed, 31 Jul 2019 10:43:04 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:4ad:5a0b:2aff:6e0f:8973:5a26])
        by smtp.gmail.com with ESMTPSA id k8sm65941259pgm.14.2019.07.31.10.43.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 10:43:03 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] watchdog: ziirave_wdt: Be more verbose during firmware update
Date:   Wed, 31 Jul 2019 10:42:50 -0700
Message-Id: <20190731174252.18041-4-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190731174252.18041-1-andrew.smirnov@gmail.com>
References: <20190731174252.18041-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add more error logging to ziirave_firm_upload() for diagnostics.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Rick Ramstetter <rick@anteaterllc.com>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/ziirave_wdt.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index 8c71341a9c1c..89ce6982ba53 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -335,14 +335,18 @@ static int ziirave_firm_upload(struct watchdog_device *wdd,
 
 	ret = ziirave_firm_write_byte(wdd, ZIIRAVE_CMD_JUMP_TO_BOOTLOADER, 1,
 				      false);
-	if (ret)
+	if (ret) {
+		dev_err(&client->dev, "Failed to jump to bootloader\n");
 		return ret;
+	}
 
 	msleep(500);
 
 	ret = ziirave_firm_write_byte(wdd, ZIIRAVE_CMD_DOWNLOAD_START, 1, true);
-	if (ret)
+	if (ret) {
+		dev_err(&client->dev, "Failed to start download\n");
 		return ret;
+	}
 
 	msleep(500);
 
-- 
2.21.0

