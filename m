Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A349601010
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Oct 2022 15:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbiJQNS7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 Oct 2022 09:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231270AbiJQNSp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 Oct 2022 09:18:45 -0400
X-Greylist: delayed 606 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 17 Oct 2022 06:18:36 PDT
Received: from kastnerfamily.de (kastnerfamily.de [85.214.209.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C996262918
        for <linux-watchdog@vger.kernel.org>; Mon, 17 Oct 2022 06:18:36 -0700 (PDT)
Received: from EIS-S230 (p4fd65cc2.dip0.t-ipconnect.de [79.214.92.194])
        by kastnerfamily.de (Postfix) with ESMTPSA id AA69020075C;
        Mon, 17 Oct 2022 15:08:28 +0200 (CEST)
Date:   Mon, 17 Oct 2022 15:08:27 +0200
From:   Thomas Kastner <code@kastnerfamily.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Thomas Kastner <thomas.kastner@advantech.com>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] drivers: watchdog: advantech_ec_wdt.c Add Advantech EC
 watchdog driver
Message-ID: <Y01Ty4bo6TuaXj6x@EIS-S230>
References: <Y00S08UV7g6ZSm9J@EIS-S230>
 <2ce281ff-264f-006f-00ec-7596fa7d855f@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ce281ff-264f-006f-00ec-7596fa7d855f@roeck-us.net>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Oct 17, 2022 at 05:24:07AM -0700, Guenter Roeck wrote:
> 
> Please drop "drivers:" and the driver name from the subject,
> version your patches, and provide change logs.
> 
> Also, please fix the following problems reported by checkpatch.

Thanks for your patience. 

Can you please confirm the version of checkpatch or any parameters used?

I'm using v0.32 which seems to be the latest in GKH's staging tree as
well as Linus' mainline. It has just given me the quoted string warning,
but not the others as below- although of course those are valid.
Just trying to get to the same result...

No questions on the other items, Will implement the changes and provide
a versioned v3 with change notes later.

> 
> CHECK: Alignment should match open parenthesis
> #144: FILE: drivers/watchdog/advantech_ec_wdt.c:55:
> +MODULE_PARM_DESC(timeout,
> +	"Default Watchdog timer setting ("
> 
> WARNING: quoted string split across lines
> #146: FILE: drivers/watchdog/advantech_ec_wdt.c:57:
> +	__MODULE_STRING(DEFAULT_TIME) "s)."
> +	"The range is from " __MODULE_STRING(MIN_TIME)
> 
> CHECK: Please don't use multiple blank lines
> #270: FILE: drivers/watchdog/advantech_ec_wdt.c:181:
