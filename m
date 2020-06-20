Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E97202025B6
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Jun 2020 19:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728373AbgFTRuQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Jun 2020 13:50:16 -0400
Received: from mail-oo1-f68.google.com ([209.85.161.68]:41591 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726838AbgFTRuP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Jun 2020 13:50:15 -0400
Received: by mail-oo1-f68.google.com with SMTP id y45so2544493ooi.8
        for <linux-watchdog@vger.kernel.org>; Sat, 20 Jun 2020 10:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hwmTKRiVDQp3i0F664avLOH0/PSbmun7vBCp1GPCqU8=;
        b=Ir642A0EhJl1T4mxMHJTiHyYvQD6DaAZgK8gzZTXuS1H0Fj2tcwx1x5bEu3PLdea/F
         MhNSpygY8j7kKwzFl+3l5dnT/GAMxA1PJB4fi2uzbuqQVKk7FRQXdQCY6wbl37Zg5o//
         PbXEha8Lh0vW6a4cly7MnT5fvTVoIgapS+iv5gq/4603zi9GIHTxuuMRczcIygTNcVl8
         dycoJi1fjznjfIy4VPipPk4LMpPF4shE6/G8kilh0z0+AaHskAsJI+4bZV5vd0nmqepu
         S1q+0T/rVbHZRXpFYn0Hbre2b+Ft/tL5/ZCx3uwdQCy37NhrvnD+7ZoKIhG+K7g93M5K
         AhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=hwmTKRiVDQp3i0F664avLOH0/PSbmun7vBCp1GPCqU8=;
        b=godrH3Y0XfideqbTLBIbBMRPPSQ6GxZdWHe5/aN9JA5ttEKufgarmoE3AC8xq/d31U
         uj9g5OO3evsCjoRnziL4CxUCLfsmmeAeo/q50X+IsRTBjqjJM9gk0Lp3bjXfoiwwaRnw
         RaiW2Q+X+YXCRJd4Lx6G+MMt2zcCgMBXf9LIqPevZd1OSVZ/5j2YNZ/cvl1W6qBLvGQQ
         phWdMwLKG3H9BGfofkZOKxFflQXW2f9E/6GT8g3fwd7ZEBLI8CQebN+Eu+PuywjEBWGQ
         pXkLviQbPaE2Sgxg5NNeSDLyuHLLB97yTXkInotg0wiCARuCiH/IRUA89VWakYLAmTeW
         i0rQ==
X-Gm-Message-State: AOAM530LwRN1fca03Q0sQ9pEgLtZd7jbgGe6QtXUMNGmOrsogfQv1X1h
        DuFPuTRfp07+RD2HbyEInA==
X-Google-Smtp-Source: ABdhPJzgvrnY+EsE/UEhh5DsOBXEomwtFkO1eVfeiJKGREQFg8uh2Hnn/eRuux2hlr9/ZmMqaSURgw==
X-Received: by 2002:a4a:9c44:: with SMTP id c4mr8271551ook.46.1592675354396;
        Sat, 20 Jun 2020 10:49:14 -0700 (PDT)
Received: from serve.minyard.net ([47.184.146.204])
        by smtp.gmail.com with ESMTPSA id g126sm1994804oia.41.2020.06.20.10.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 10:49:12 -0700 (PDT)
Received: from t560.minyard.net (unknown [IPv6:2001:470:b8f6:1b:98f8:1e34:b5b7:82f7])
        by serve.minyard.net (Postfix) with ESMTPA id 9296118054B;
        Sat, 20 Jun 2020 17:49:11 +0000 (UTC)
From:   minyard@acm.org
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 03/10] watchdog: Add documentation for read capability
Date:   Sat, 20 Jun 2020 12:49:00 -0500
Message-Id: <20200620174907.20229-4-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200620174907.20229-1-minyard@acm.org>
References: <20200620174907.20229-1-minyard@acm.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

Document the read, poll, and async operations.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 Documentation/watchdog/watchdog-kernel-api.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/watchdog/watchdog-kernel-api.rst b/Documentation/watchdog/watchdog-kernel-api.rst
index 068a55ee0d4a..aa15a2d35397 100644
--- a/Documentation/watchdog/watchdog-kernel-api.rst
+++ b/Documentation/watchdog/watchdog-kernel-api.rst
@@ -132,6 +132,10 @@ The list of watchdog operations is defined as::
 	unsigned int (*get_timeleft)(struct watchdog_device *);
 	int (*restart)(struct watchdog_device *);
 	long (*ioctl)(struct watchdog_device *, unsigned int, unsigned long);
+	ssize_t (*read)(struct watchdog_device *, struct file *, char __user *,
+			size_t, loff_t *);
+	__poll_t (*poll)(struct watchdog_device *, struct file *, poll_table *);
+	int (*fasync)(struct watchdog_device *, int, struct file *, int);
   };
 
 It is important that you first define the module owner of the watchdog timer
@@ -235,6 +239,14 @@ they are supported. These optional routines/operations are:
   our own internal ioctl call handling. This routine should return -ENOIOCTLCMD
   if a command is not supported. The parameters that are passed to the ioctl
   call are: watchdog_device, cmd and arg.
+* read: If a read call comes in on the watchdog device, call this function.
+  This allows a watchdog to provide data to the user.
+* poll: If a poll call comes in on the watchdog device, call this.  This
+  allows the user to do select/poll waiting on the device to have read data
+  ready.
+* fasync: If a fasync call comes in on the watchdog, call this.  This
+  allows the user to do async operations waiting for read data from
+  the device.
 
 The status bits should (preferably) be set with the set_bit and clear_bit alike
 bit-operations. The status bits that are defined are:
-- 
2.17.1

