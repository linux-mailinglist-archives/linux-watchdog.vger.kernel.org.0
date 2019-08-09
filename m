Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 789C58791C
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2019 13:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfHIL7u (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Aug 2019 07:59:50 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:57286 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbfHIL7t (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Aug 2019 07:59:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1565351987; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=SmqGZ1fhKy+Ozn7/u/eOZiicRz2AS55x2H0mZNVURdw=;
        b=RXxr/UT4Wi8+QHzJJmycPI80Z1j/L6lAZnOWF3gnqM0YmLBXz6kxjpAnRoVJkUluNFeY6n
        GgpedU7IzsOJbz8ZSoPwrAOiNjKimqdxQ3x4anQcJdsFnfXls5YqP8D5V/Q4+W0EcOMhqS
        jirGeF5jyzDcmKH/oyzcexo7dMx0MKw=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     od@zcrc.me, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] watchdog: jz4740: Driver update
Date:   Fri,  9 Aug 2019 13:59:27 +0200
Message-Id: <20190809115930.6050-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

This patchset comes from a bigger patchset that was cut in smaller
pieces for easier integration to mainline.
(The patchset was https://lkml.org/lkml/2019/3/27/1837)

The reviews were kept since the code mostly didn't change. The exception
is the use of device_node_to_regmap() in patch 2/3. This function was
added in a prior patch, now merged in the MIPS tree.

For that reason this patchset is based on the ingenic-tcu-v5.4 branch of
the MIPS tree
(git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git).

Thanks,
-Paul


