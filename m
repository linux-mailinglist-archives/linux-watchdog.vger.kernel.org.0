Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E934819CECF
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Apr 2020 05:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390361AbgDCDP1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 Apr 2020 23:15:27 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42104 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389108AbgDCDP1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 Apr 2020 23:15:27 -0400
Received: by mail-pg1-f196.google.com with SMTP id g6so885655pgs.9;
        Thu, 02 Apr 2020 20:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IltRVvoEayvKnGQ7Rvg+SGl6Ghv0uHLFOtdxZ3fkhes=;
        b=szVOgU7Ij4bSfc5vyUiBZrP7e8JPps3osaheiOwDv3b75Tf8c7S5eOrDm3X4aj1pUs
         5XE9aR8GPtTUN7LY6z75qdznZg6T55luMJOgOjptgGFPwRN4AYzSRHj2ynHB0K16EPRF
         3wZ715ZheMCdDSHJXoVymeFcIquijvxPiMwJBtZCReJUO+dHmV1DmtOWkYsMBkgyiwsa
         P6jcVFj0nZSz1F8ZsEtqAPH62fmFLMPPDFBQ6blfoGruJODSXJ0xZsVayhH0a6n+2z2w
         GcGQ4rxj+AxCAqpAm+aJvsJoiPl7e9WKmAJQkJ0LsJxZFLZ76I+hsW+2eaBvPFaCMqQX
         uaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IltRVvoEayvKnGQ7Rvg+SGl6Ghv0uHLFOtdxZ3fkhes=;
        b=eXCpYV5rucNiWq/97dPJb7Ee/A5s4w/FY0AeMxmVxnpqhRnt9QxkXDSnWGKfYI2ons
         sMm2gG3Ez0/By+ab+KOfXHT0am/SH2VcnHgnhRQZsxqD6sSXEiuOLdcP/6q5SiZDK+N0
         1Bbv0G4B1rtQiEqv5Duidb263rMRzxLyEwdlbwtcKxzVN8SLDM+KEWg7F7aon+ShpAAO
         SnkUfU+KG93qnLK0ueXOlTQTW3NhpwQSRmqhAAebmT/l6Xl5glNkGf0QP9eIyuRZFXZq
         MmaRIGfIniskr86TpVhKMVPsRdCXny5CD9mWjtCmI51i5y/QRmIhAtmW4dj9rUGfc02X
         +DEw==
X-Gm-Message-State: AGi0PuZdMiOa5+TUw0ZytJhwf4VIakaJBXiPmfScSAaQ5mk7TqFUOGRA
        sb//kM1Oqv2N1RmDOzDD7Mk=
X-Google-Smtp-Source: APiQypIVQRcm0aBnBr00r95OdVOthcz4CyGfJdX4V8++0u4zxQyVA7xcKvvnkM0rhmRRZJtQZIpSuA==
X-Received: by 2002:aa7:8f3a:: with SMTP id y26mr6219658pfr.180.1585883725969;
        Thu, 02 Apr 2020 20:15:25 -0700 (PDT)
Received: from localhost.localdomain ([211.250.214.198])
        by smtp.gmail.com with ESMTPSA id t1sm4325811pgh.88.2020.04.02.20.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 20:15:25 -0700 (PDT)
From:   Bumsik Kim <kbumsik@gmail.com>
X-Google-Original-From: Bumsik Kim <k.bumsik@gmail.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, corbet@lwn.net
Cc:     linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Bumsik Kim <k.bumsik@gmail.com>
Subject: [PATCH] watchdog: clarify that stop() is optional
Date:   Fri,  3 Apr 2020 12:15:07 +0900
Message-Id: <20200403031507.63487-1-k.bumsik@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The commit d0684c8a9354 ("watchdog: Make stop function optional")
made stop function not mandatory, but the comments
and the doc weren't reflected. Fix it to clarify.

Signed-off-by: Bumsik Kim <k.bumsik@gmail.com>
---
 Documentation/watchdog/convert_drivers_to_kernel_api.rst | 2 +-
 Documentation/watchdog/watchdog-kernel-api.rst           | 2 +-
 include/linux/watchdog.h                                 | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/watchdog/convert_drivers_to_kernel_api.rst b/Documentation/watchdog/convert_drivers_to_kernel_api.rst
index dd934cc08e40..51b999b5551a 100644
--- a/Documentation/watchdog/convert_drivers_to_kernel_api.rst
+++ b/Documentation/watchdog/convert_drivers_to_kernel_api.rst
@@ -115,7 +115,7 @@ Add the watchdog operations
 ---------------------------
 
 All possible callbacks are defined in 'struct watchdog_ops'. You can find it
-explained in 'watchdog-kernel-api.txt' in this directory. start(), stop() and
+explained in 'watchdog-kernel-api.txt' in this directory. start() and
 owner must be set, the rest are optional. You will easily find corresponding
 functions in the old driver. Note that you will now get a pointer to the
 watchdog_device as a parameter to these functions, so you probably have to
diff --git a/Documentation/watchdog/watchdog-kernel-api.rst b/Documentation/watchdog/watchdog-kernel-api.rst
index 864edbe932c1..068a55ee0d4a 100644
--- a/Documentation/watchdog/watchdog-kernel-api.rst
+++ b/Documentation/watchdog/watchdog-kernel-api.rst
@@ -123,8 +123,8 @@ The list of watchdog operations is defined as::
 	struct module *owner;
 	/* mandatory operations */
 	int (*start)(struct watchdog_device *);
-	int (*stop)(struct watchdog_device *);
 	/* optional operations */
+	int (*stop)(struct watchdog_device *);
 	int (*ping)(struct watchdog_device *);
 	unsigned int (*status)(struct watchdog_device *);
 	int (*set_timeout)(struct watchdog_device *, unsigned int);
diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index 417d9f37077a..1464ce6ffa31 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -37,15 +37,15 @@ struct watchdog_governor;
  *
  * The watchdog_ops structure contains a list of low-level operations
  * that control a watchdog device. It also contains the module that owns
- * these operations. The start and stop function are mandatory, all other
+ * these operations. The start function is mandatory, all other
  * functions are optional.
  */
 struct watchdog_ops {
 	struct module *owner;
 	/* mandatory operations */
 	int (*start)(struct watchdog_device *);
-	int (*stop)(struct watchdog_device *);
 	/* optional operations */
+	int (*stop)(struct watchdog_device *);
 	int (*ping)(struct watchdog_device *);
 	unsigned int (*status)(struct watchdog_device *);
 	int (*set_timeout)(struct watchdog_device *, unsigned int);
-- 
2.26.0

