Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D01C13D4EA
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jan 2020 08:23:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730568AbgAPHXa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 16 Jan 2020 02:23:30 -0500
Received: from stcim.de ([78.46.90.227]:47336 "EHLO stcim.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730400AbgAPHX3 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 16 Jan 2020 02:23:29 -0500
Received: from [2001:4dd4:d47c:0:a288:b4ff:fee5:f5cc] (helo=porty)
        by stcim with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <contact@stefanchrist.eu>)
        id 1irzUv-0004a2-CJ; Thu, 16 Jan 2020 08:23:21 +0100
Date:   Thu, 16 Jan 2020 08:23:20 +0100
From:   Stefan Lengfeld <contact@stefanchrist.eu>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     support.opensource@diasemi.com, linux@roeck-us.net,
        Adam.Thomson.Opensource@diasemi.com,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] watchdog: da9062: make restart handler atomic safe
Message-ID: <20200116072320.f7ia3e76hx7yknqb@porty>
References: <20200115162307.7336-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200115162307.7336-1-m.felsch@pengutronix.de>
X-PGP-Key: https://stefanchrist.eu/personal/Stefan_Lengfeld_0xE44A23B289092311.asc
User-Agent: NeoMutt/20180716
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Marco,

On Wed, Jan 15, 2020 at 05:23:07PM +0100, Marco Felsch wrote:
> The restart handler is executed during the shutdown phase which is
> atomic/irq-less. The i2c framework supports atomic transfers since
> commit 63b96983a5dd ("i2c: core: introduce callbacks for atomic
> transfers") to address this use case. Using regmap within an atomic
> context is allowed only if the regmap type is MMIO and the cache type
> 'flat' or no cache is used. Using the i2c_smbus_write_byte_data()
> function can be done without additional tests because:
>  1) the DA9062 is an i2c-only device and
>  2) the i2c framework emulates the smbus protocol if the host adapter
>     does not support smbus_xfer by using the master_xfer.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Stefan Lengfeld <contact@stefanchrist.eu>


On Wed, Marco Flesch wrote [1]:
> I will send a v2 to cover Guenter's suggestion. Can I keep your reviewed
> by tag?

Yes, you can keep it. See above. I also checked by reading the code that
'i2c_smbus_write_byte_data' behaves the same as 'i2c_transfer'. Just
with some indirections.

Kind regards,
    Stefan

[1]: https://www.spinics.net/lists/linux-watchdog/msg17194.html
