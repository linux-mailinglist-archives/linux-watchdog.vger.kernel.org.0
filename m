Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 828ED3B08FA
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Jun 2021 17:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231552AbhFVP3y (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Jun 2021 11:29:54 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:57599 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbhFVP3w (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Jun 2021 11:29:52 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lviJK-00027K-ME; Tue, 22 Jun 2021 15:27:34 +0000
To:     Curtis Klein <curtis.klein@hpe.com>
From:   Colin Ian King <colin.king@canonical.com>
Subject: re: watchdog: Add hrtimer-based pretimeout feature
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <244ef2f1-9dfb-6ac3-3ab8-f8f0cabda93f@canonical.com>
Date:   Tue, 22 Jun 2021 16:27:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

Static analysis using Coverity on linux-next has found an issue in
function watchdog_cdev_unregister in source
drivers/watchdog/watchdog_dev.c with the following commit:

commit 7b7d2fdc8c3e3f9fdb3558d674e1eeddc16c7d9e
Author: Curtis Klein <curtis.klein@hpe.com>
Date:   Wed Feb 3 12:11:30 2021 -0800

    watchdog: Add hrtimer-based pretimeout feature

The analysis is as follows:

1084 static void (struct watchdog_device *wdd)
1085 {
1086        struct watchdog_core_data *wd_data = wdd->wd_data;
1087
1088        cdev_device_del(&wd_data->cdev, &wd_data->dev);

    1. Condition wdd->id == 0, taking true branch.

1089        if (wdd->id == 0) {
1090                misc_deregister(&watchdog_miscdev);
1091                old_wd_data = NULL;
1092        }
1093

    2. Condition watchdog_active(wdd), taking true branch.
    3. Condition test_bit(4, &wdd->status), taking true branch.

1094        if (watchdog_active(wdd) &&
1095            test_bit(WDOG_STOP_ON_UNREGISTER, &wdd->status)) {
1096                watchdog_stop(wdd);
1097        }
1098
1099        mutex_lock(&wd_data->lock);
1100        wd_data->wdd = NULL;

    4. assign_zero: Assigning: wdd->wd_data = NULL.

1101        wdd->wd_data = NULL;
1102        mutex_unlock(&wd_data->lock);
1103
1104        hrtimer_cancel(&wd_data->timer);
1105        kthread_cancel_work_sync(&wd_data->work);

Explicit null dereferenced (FORWARD_NULL)

    5. var_deref_model: Passing wdd to watchdog_hrtimer_pretimeout_stop,
which dereferences null wdd->wd_data.

1106        watchdog_hrtimer_pretimeout_stop(wdd);
1107
1108        put_device(&wd_data->dev);
1109 }

The call to watchdog_hrtimer_pretimeout_stop dereferences wdd as follows:

41 void watchdog_hrtimer_pretimeout_stop(struct watchdog_device *wdd)
42 {

  1. deref_parm_field_in_call: Function hrtimer_cancel dereferences an
offset off wdd->wd_data.

43        hrtimer_cancel(&wdd->wd_data->pretimeout_timer);
44 }

Since wdd->wd_data is set to NULL on line 1101, the call to
watchdog_hrtimer_pretimeout_stop will always trip a null pointer
dereference.  Shall we just remove that call?

Colin
