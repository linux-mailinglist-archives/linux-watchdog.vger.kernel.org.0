Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1B073DE50
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Jun 2023 13:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjFZL6K (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Jun 2023 07:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjFZL6I (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Jun 2023 07:58:08 -0400
X-Greylist: delayed 514 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 26 Jun 2023 04:58:06 PDT
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 060DC1B7
        for <linux-watchdog@vger.kernel.org>; Mon, 26 Jun 2023 04:58:05 -0700 (PDT)
Received: by www.linux-watchdog.org (Postfix, from userid 500)
        id 38E91409F8; Mon, 26 Jun 2023 13:49:30 +0200 (CEST)
Date:   Mon, 26 Jun 2023 13:49:30 +0200
From:   Wim Van Sebroeck <wim@linux-watchdog.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] watchdog: ziirave_wdt: Switch i2c driver back to use
 .probe()
Message-ID: <20230626114929.GA14952@www.linux-watchdog.org>
References: <20230525210837.735447-1-u.kleine-koenig@pengutronix.de>
 <1a2f452a-14f4-4b29-b1c2-8e69d5d86814@roeck-us.net>
 <20230611111312.s4uauybzhqagjmoq@pengutronix.de>
 <2554f83c-2d7a-cdf0-0a84-4addc21073bd@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2554f83c-2d7a-cdf0-0a84-4addc21073bd@roeck-us.net>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

> On 6/11/23 04:13, Uwe Kleine-König wrote:
> >Hello,
> >
> >On Fri, May 26, 2023 at 09:55:20AM -0700, Guenter Roeck wrote:
> >>On Thu, May 25, 2023 at 11:08:37PM +0200, Uwe Kleine-König wrote:
> >>>After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> >>>call-back type"), all drivers being converted to .probe_new() and then
> >>>03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
> >>>convert back to (the new) .probe() to be able to eventually drop
> >>>.probe_new() from struct i2c_driver.
> >>>
> >>>Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> >>
> >>Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> >
> >I assume this is a nice start to get this applied for the next merge
> >window. The patch didn't show up in next yet though. Is that because Wim
> >didn't start applying patches yet, or is there a problem (like this
> >patch being lost in Wim's mailbox)?
> >
> 
> lack of time on my side, and Wim typically picks up patches quite late into
> his branch.

Indeed correct. And this time a week to late because my mother in law died the 31st...
But working on getting patches in now.

This is what I think was reviewed or acked:
[PATCH v2 2/2] watchdog: loongson1_wdt: Add DT support
[PATCH] dt-bindings: xilinx: Switch xilinx.com emails to amd.com
[PATCH 1/2] watchdog: Convert GPL 2.0 notice to SPDX identifier
[PATCH 2/2] watchdog: ibmasr: Replace GPL license notice with SPDX identifier
[PATCH] watchdog: ziirave_wdt: Switch i2c driver back to use .probe()
[PATCH V4 3/4] watchdog: xilinx_wwdt: Add Versal window watchdog support
[PATCH V4 2/4] dt-bindings: watchdog: xlnx,versal-wwdt: Add versal watchdog
[PATCH V4 4/4] MAINTAINERS: Add support for Xilinx versal watchdog
[PATCH 7/7] dt-bindings: watchdog: restrict node name suffixes
[v1,1/1] watchdog: sp5100_tco: support Hygon FCH/SCH (Server Controller Hub)

Kind regards,
Wim.

