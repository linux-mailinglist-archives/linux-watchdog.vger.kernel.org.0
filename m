Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D354911ED27
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Dec 2019 22:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725747AbfLMVsR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 13 Dec 2019 16:48:17 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:35764 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725554AbfLMVsR (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 13 Dec 2019 16:48:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=/cMJh1arzL1EQMc80uVhvfY+21Vl1jVbGWa+Vi197yI=; b=BzJ+JACKjky52b3ppckGrvYYhx
        D/SC1RW8cHLSf9IymePmf9a5ceFzVXAfpq0KquPhDVrGx8/PIMC9GAj1uptv85+KjKHxD8WIw2AyO
        9/T+YtudU8ZO69SYrLvrKZtxD58WiQs22X3u8JMFBRZCkxH7Off1YCjf68rba6xrXL9I=;
Received: from p200300ccff0d15001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0d:1500:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1ifsnE-0004ma-Bk; Fri, 13 Dec 2019 22:48:12 +0100
Received: from andi by aktux with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1ifsnE-0005nv-0E; Fri, 13 Dec 2019 22:48:12 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] watchdog: rn5t618_wdt: fix module aliases
Date:   Fri, 13 Dec 2019 22:48:02 +0100
Message-Id: <20191213214802.22268-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Platform device aliases were missing so module autoloading
did not work.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/watchdog/rn5t618_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/rn5t618_wdt.c b/drivers/watchdog/rn5t618_wdt.c
index 234876047431..6e524c8e26a8 100644
--- a/drivers/watchdog/rn5t618_wdt.c
+++ b/drivers/watchdog/rn5t618_wdt.c
@@ -188,6 +188,7 @@ static struct platform_driver rn5t618_wdt_driver = {
 
 module_platform_driver(rn5t618_wdt_driver);
 
+MODULE_ALIAS("platform:rn5t618-wdt");
 MODULE_AUTHOR("Beniamino Galvani <b.galvani@gmail.com>");
 MODULE_DESCRIPTION("RN5T618 watchdog driver");
 MODULE_LICENSE("GPL v2");
-- 
2.20.1

