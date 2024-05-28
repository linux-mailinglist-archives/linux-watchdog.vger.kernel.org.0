Return-Path: <linux-watchdog+bounces-1074-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A278D1AA9
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 May 2024 14:08:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B81ECB21F24
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 May 2024 12:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F89213A242;
	Tue, 28 May 2024 12:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+FXP0OY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD3716C863;
	Tue, 28 May 2024 12:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716898085; cv=none; b=tlPLLfFvpwsqyND/hTcxo2teMGaRf+wpMeDz/BDh8ng3vtaNCu6uw9QVpqIQ1I9/XIzqHZPkFRhnK9ndxjU1rTMbrWmqNTIwn5TFHK5WKo5ESOIm2RF/DKPtxa1Rg0C0W8m2S2XPNjIFnWyTeZ1cn8qwqQK52CWESEBy/UNkZ2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716898085; c=relaxed/simple;
	bh=jWIk4zCSEH8ftg3VJcfrN26WHi7FnSNBPYkXftuiS80=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iUHHghDw7oziij1Gz1tO22Ztye96x6Pj0Mk2X4o5pxVqDOic/Tc6i9/5QnyQ/bpAn11NjmoFkKrqLow+j7gqI42KYiniO7qOY8beyWWDtPGZ5rt8RTJ+0FqSyOv5GJAYwEa72gh9vatH5+TG+JOP6hXgGTRPAdmXNZxMwbv68lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i+FXP0OY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9664FC3277B;
	Tue, 28 May 2024 12:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716898084;
	bh=jWIk4zCSEH8ftg3VJcfrN26WHi7FnSNBPYkXftuiS80=;
	h=From:To:Cc:Subject:Date:From;
	b=i+FXP0OYq7CQ+Uobsr+OoL5JuAn0LqqqpQGECrprPQgZ/a08GHCchYKs8LHKBn2Yk
	 kgCbFKXHPEy2NflkIlARhAHMpSVzEFet5Xbf+7zXnt3llDIbOiX/AcrMh/vD3SraWQ
	 WBNNNXKwaNqdbK/IU46REw8wqRjfw4MGj2CH7omrnvir/abOsDtQwEyWUVujRACXCv
	 GJfiRVXMlNIfgar1xhp8zNDzY7Z/VaSLnNCHhxo7F9Cx+f7H8xOVLUOUxQ7BqzRui3
	 4oNjIzOwhsYifAglhr6W+MPP+t8h+5PHBjfEu76YZ0ZTeeniZeUTlYkhxqOqwVQeYd
	 34qeVjb5/6f5g==
From: Arnd Bergmann <arnd@kernel.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	David Ober <dober@lenovo.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: lenovo_se10_wdt: add HAS_IOPORT dependency
Date: Tue, 28 May 2024 14:07:31 +0200
Message-Id: <20240528120759.3491774-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Once the inb()/outb() helpers become conditional, the newly added driver
fails to link on targets without CONFIG_HAS_IOPORT:

In file included from arch/arm64/include/asm/io.h:299,
                 from include/linux/io.h:14,
                 from drivers/watchdog/lenovo_se10_wdt.c:8:
drivers/watchdog/lenovo_se10_wdt.c: In function 'set_bram':
include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
  596 | #define _outb _outb
include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
  655 | #define outb _outb
      |              ^~~~~
drivers/watchdog/lenovo_se10_wdt.c:67:9: note: in expansion of macro 'outb'
   67 |         outb(offset, bram_base);
      |         ^~~~

Add the same dependency we added to the other such drivers.

Fixes: 1f6602c8ed1e ("watchdog: lenovo_se10_wdt: Watchdog driver for Lenovo SE10 platform")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/watchdog/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 5f91921afc79..24ea3b6f95fe 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -257,6 +257,7 @@ config GPIO_WATCHDOG_ARCH_INITCALL
 config LENOVO_SE10_WDT
 	tristate "Lenovo SE10 Watchdog"
 	depends on (X86 && DMI) || COMPILE_TEST
+	depends on HAS_IOPORT
 	select WATCHDOG_CORE
 	help
 	  If you say yes here you get support for the watchdog
-- 
2.39.2


