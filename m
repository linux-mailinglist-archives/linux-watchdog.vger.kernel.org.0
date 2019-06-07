Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4910391DD
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2019 18:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730599AbfFGQYo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Jun 2019 12:24:44 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:59068 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730059AbfFGQYo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Jun 2019 12:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1559924681; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=mcQ/t/D7ql8zsl47FLhRZOVHwEqpOyHcf2rB4FvEu7U=;
        b=qNm+4cQaAJhBObHd+lCjEySlXv/b0p4Av4oSvs4sTyq2KxwFNWIKkxFHcLLhAuZG8ov8fo
        9WdYpspyCYE6EaRuuDvWTL3Co9B+mRtaCyjQGYFvdQAhB9kmaOYpai3bCFiKIgix2PZy5y
        6BtHGkDPhKx6CDXR6Ez92qFOVzHaAbc=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     od@zcrc.me, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] JZ4740 watchdog cleanups
Date:   Fri,  7 Jun 2019 18:24:25 +0200
Message-Id: <20190607162429.17915-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

V1 patchset didn't apply anymore on v5.2-rc3 so I rebased on top of it.
The previous patch 4/4 (which added SPDX license notifier) has been
dropped since somebody else did the job in -rc3.
So I added another cleanup as patch 4/4, and I tweaked patch 2/4 to
adjust to Guenter's feedback on V1.

Cheers
-Paul


