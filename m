Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CEF523FD19
	for <lists+linux-watchdog@lfdr.de>; Sun,  9 Aug 2020 09:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgHIHTS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 9 Aug 2020 03:19:18 -0400
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:48714 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgHIHTS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 9 Aug 2020 03:19:18 -0400
Received: from localhost.localdomain ([93.22.150.139])
        by mwinf5d64 with ME
        id DKKE2300N30hzCV03KKFvD; Sun, 09 Aug 2020 09:19:16 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 09 Aug 2020 09:19:16 +0200
X-ME-IP: 93.22.150.139
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] watchdog: pcwd_usb: Avoid GFP_ATOMIC where it is not needed
Date:   Sun,  9 Aug 2020 09:19:12 +0200
Message-Id: <20200809071912.742836-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

There is no need to use GFP_ATOMIC here. It is a probe function, no
spinlock is taken and GFP_KERNEL is used just before and just after this
'usb_alloc_coherent()' call.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/watchdog/pcwd_usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/pcwd_usb.c b/drivers/watchdog/pcwd_usb.c
index 2f44af1831d0..ea67b98ed35d 100644
--- a/drivers/watchdog/pcwd_usb.c
+++ b/drivers/watchdog/pcwd_usb.c
@@ -657,7 +657,7 @@ static int usb_pcwd_probe(struct usb_interface *interface,
 
 	/* set up the memory buffer's */
 	usb_pcwd->intr_buffer = usb_alloc_coherent(udev, usb_pcwd->intr_size,
-					GFP_ATOMIC, &usb_pcwd->intr_dma);
+					GFP_KERNEL, &usb_pcwd->intr_dma);
 	if (!usb_pcwd->intr_buffer) {
 		pr_err("Out of memory\n");
 		goto error;
-- 
2.25.1

