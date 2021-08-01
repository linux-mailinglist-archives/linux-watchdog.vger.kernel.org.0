Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C553DCAA9
	for <lists+linux-watchdog@lfdr.de>; Sun,  1 Aug 2021 09:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbhHAH4u (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 1 Aug 2021 03:56:50 -0400
Received: from mout.web.de ([217.72.192.78]:54463 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229543AbhHAH4u (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 1 Aug 2021 03:56:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1627804586;
        bh=ybETWJ69FP1eklPrS3Vlls+0FH07W6kXIry6yZLnVHA=;
        h=X-UI-Sender-Class:From:Subject:To:Cc:Date;
        b=qIgytIIPaMCwaRq6gt6fgUNEyLKI4IDCgv6epdY8gb1Qf4zOMofj0I8j5tnJ5H+AG
         Y0hVsyyPRGUvjgDKhAJGdn9Jps0gYzz05m2gTCzM8bcLdCc4o6QPNiVSQeUNwF/bjm
         InwMEFEkm5tOUYDnozmmLBxlauBD8RBiFGdeajH4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.227]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MLgUx-1m9p5F2l9f-000qwY; Sun, 01
 Aug 2021 09:56:26 +0200
From:   Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH v2] watchdog: Start watchdog in watchdog_set_last_hw_keepalive
 only if appropriate
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <93d56386-6e37-060b-55ce-84de8cde535f@web.de>
Date:   Sun, 1 Aug 2021 09:56:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nYWxU0jdTKdDADeNmlGW1+5lohCYi/RQrtK1xOW9eNP9iY1+86G
 AHb8onfpMNkJkzx8Xxe2wNipg05gdUVjAI1uUB6hZkbenQzeZ4p2jZZn5yVLzWOd89ysv1T
 ju+1QulrOg8Th6g0G+MC3K3NRifRyrXS9CdnZgiJIhLByDeA2b9dZueIsM+wcf02S6/oN0j
 39FQ4QOOMC7ab7K1K88Wg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vkaVJBxNU3Q=:8x569OsVVEBvGWom5INHSc
 CYevetlYmZkMM+rYcdd0KNNnashKtSJfLne24uVOC06U/MI2JSS1eyhyE4kpURORypgIlQAL4
 fh5XEfFCKFLfLmMaORtmISNvn98H2Q6vQHVF7ElPdc56ZhqB00Rjt5Hh9UXiMFzbMJRphM+es
 2dvBBaVgtI9IyYoGvuUNBkvTOQLsQhv/GrP20BZY9m2nTia+mS6ogtvp5OkMwkFFbA/H+/VbD
 5fFCTLXyog2NqmTwtuw3SMogLVn2adjZVW9dPO6WJWRZVHDCgJ0pvZ3CJ8v4g0v9YTjdZ8Bui
 dKLEogJxri+PtxcuIe5YdPC69QQJcbHVjLOGwrHC2Fq7AsGUeLTJqdzmJtL82+BsjXIuuN3O6
 NvOrqlqlJ1tKLlpiHVr5ekQsmQl2VWexc1HBr+2Rfs47FDB/nN39JYie4LQ3bk1QRM2V72ayB
 TUVgijboREDBJpXMk2VpKkgkAoWqcZrfAHVttkafWe54pwoA/Ad/Gonfuq154fvwqYMJk7pmS
 k4rhoV1Fp34/fw1Ur+whiz+3KSEfe94XaNKxVpzkgetR0m6HHLo1VHEhM3GC+nqFgjdGyDZ5k
 H5RAnDHRtTiUA10V3aQeVKPDJ6MIXm+uxCwL4vfjMjp31TUNb5wIwHuC+6Tp6KlLG4iL5RBHi
 T9AYe2BzO6WpRhnb8J0Eyyqp5mBfulJVAqykvlGlxYp+962V5gNPI69Ji6Pl0DJHyrpIvHhI6
 QX74udClHFmKhSW7VSsnEcXgGvnBgymL51CraiXp5+ucSxVSj4OIwQHorFNf7gfCB3ta013PJ
 XZXT8EIXq7Rg4uTYEdD6x7KhpJrSLywIaALHn2zZM1xJWCR0X2uMqhALXLUKpHqHs3T7gnOLw
 2C387SbclBHrUilw2KwaOt6LgqTO7tQT8VcvJz84qMmQqjVyb9gy35UclNm5W/JSkggOa3ONy
 soWlBrVfYasIonyDlW9hOUojR5btV0kjp5nEGJaJUE8RbhAYPB6wWtVrvwCBOWFW1IjQszQfa
 UIpWXLO8gRVcb2dT4m4ViHGze2m82W8c+H6ui2lYllK+fTPpQehkYJL0/IMKBpUqyEj1Af8bT
 Yoz2YYuRK5uUsSi9bX56J6NXAmxXHIsm2gr
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Jan Kiszka <jan.kiszka@siemens.com>

We must not pet a running watchdog when handle_boot_enabled is off
because this will kick off automatic triggering before userland is
running, defeating the purpose of the handle_boot_enabled control.
Furthermore, don't ping in case watchdog_set_last_hw_keepalive was
called incorrectly when the hardware watchdog is actually not running.

Fixed: cef9572e9af3 ("watchdog: add support for adjusting last known HW ke=
epalive time")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
=2D--

Changes to v1 ("watchdog: Respect handle_boot_enabled when setting last la=
st_hw_keepalive"):
 - add watchdog_hw_running test
 - improve commit log

 drivers/watchdog/watchdog_dev.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_d=
ev.c
index 3bab32485273..6c73160386b9 100644
=2D-- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -1172,7 +1172,10 @@ int watchdog_set_last_hw_keepalive(struct watchdog_=
device *wdd,

 	wd_data->last_hw_keepalive =3D ktime_sub(now, ms_to_ktime(last_ping_ms))=
;

-	return __watchdog_ping(wdd);
+	if (watchdog_hw_running(wdd) && handle_boot_enabled)
+		return __watchdog_ping(wdd);
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(watchdog_set_last_hw_keepalive);

=2D-
2.31.1
