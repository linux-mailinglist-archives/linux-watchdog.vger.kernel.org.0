Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF8D73EC4B5
	for <lists+linux-watchdog@lfdr.de>; Sat, 14 Aug 2021 21:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhHNTOh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 14 Aug 2021 15:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbhHNTOg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 14 Aug 2021 15:14:36 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 402D1C061764
        for <linux-watchdog@vger.kernel.org>; Sat, 14 Aug 2021 12:14:08 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id gz13-20020a17090b0ecdb0290178c0e0ce8bso15084085pjb.1
        for <linux-watchdog@vger.kernel.org>; Sat, 14 Aug 2021 12:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K6P+SxuPkz8jn/H05YhluGjv7NCf/43kOXbbbUxUyl4=;
        b=mSrmQixlkHSIyoYF2JzUF/ymcz8DrSl/HKZBdy3QmgO1C5tjBux+DSoom1HddSiycw
         R6HLXcfZY1F5UZMafOWBTe0EOONQwzPp0/qQyVdZwuf1eJ2HCaw+dxGtth+NFAvEV9q5
         XJQ7OpWNgmuZEkpOZLhuGNqisnXHHQ39Oqrbme3lFxSYDyTZLwp2/8RLY4mMSNRDLPRo
         ss+FOuWAXVIxw9g9kf0ocm3bZTJTTAc3ChZgO1LnQRIG/tgSQNVgUyugxRk6L363Qzf/
         vUQE5CFrz/93Rl9NBPEmsV9wkecytdmn39YIwJif/HCWF8hjcoueFoajs9YiliU/QJvH
         nSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K6P+SxuPkz8jn/H05YhluGjv7NCf/43kOXbbbUxUyl4=;
        b=o6LMkhXiE8oUmHV5h/JTJVLJH+J/eDoMYLMbybKder/OAKl8Dv5iP8M8CHZccHNZsu
         vfdiPXfD746cNQmbdNW+XC7bx5Qxg2BL8Kifx1eDA9KECDicA2hPLmdgn0ctTbYJRvgW
         x84M2TY/tqstI1GPIyz2ARPgnCFFi661ixsjgGFnqDdt2ypm/rbV57OiLzXfy8mY3dQz
         NkrsP2ygsyIX+DUBN+mY1T7ft7ux9/Y2h0P4kb2w2ibcc9AvGxPNyffeBtkTYT+ltHu2
         0e1mr+orpj1NRR6VYlr81BQSX5SK+UQ4e7id2DSWbiWVf17KBZEIHokHDjRlweVt9cno
         rP2A==
X-Gm-Message-State: AOAM530/4FQBOGKUW5Exli1Oev1iITeIBxGoKgJD837FBANBep4XBLTX
        cwYFaak6sPKa30mrMqjJJtG2WoKrVXVyxg==
X-Google-Smtp-Source: ABdhPJzeApZKHxMjt5JDow9nzzVkVe/uGOgjOT7ds/zkuOBu7nnASmogpyIIflDHW3cs8TNp5LlthA==
X-Received: by 2002:a65:6107:: with SMTP id z7mr7870001pgu.43.1628968447743;
        Sat, 14 Aug 2021 12:14:07 -0700 (PDT)
Received: from stas-Latitude-5300.lan ([2409:10:27a0:2500:3131:a211:8322:1585])
        by smtp.gmail.com with ESMTPSA id u13sm6340979pfh.123.2021.08.14.12.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Aug 2021 12:14:07 -0700 (PDT)
From:   Stanislav German-Evtushenko <ginermail@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org,
        Stanislav German-Evtushenko <ginermail@gmail.com>
Subject: [PATCH] watchdog: Device must be opened for writing
Date:   Sun, 15 Aug 2021 04:13:45 +0900
Message-Id: <20210814191345.27221-1-ginermail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

If userspace opens the watchdog device self-feeding stops. Sometimes
opening the device happens by accident, e.g. by mistakenly running grep
recursively in a wrong directory which leads to the server being reset.

Watchdog device does not handle read operation therefore the issue can be
prevented by requiring the device to be opened for writing:

- Prevent opening the device without FMODE_WRITE

Signed-off-by: Stanislav German-Evtushenko <ginermail@gmail.com>
---
 drivers/watchdog/watchdog_dev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 3bab32485273..28b88542a4d0 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -835,6 +835,10 @@ static int watchdog_open(struct inode *inode, struct file *file)
 	bool hw_running;
 	int err;
 
+	/* Must be open for writing */
+	if (!(file->f_mode & FMODE_WRITE))
+		return -EINVAL;
+
 	/* Get the corresponding watchdog device */
 	if (imajor(inode) == MISC_MAJOR)
 		wd_data = old_wd_data;

base-commit: cf813c67d9619fd474c785698cbed543b94209dd
-- 
2.25.1

