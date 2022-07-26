Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85687580C37
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 Jul 2022 09:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237932AbiGZHOO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 26 Jul 2022 03:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237898AbiGZHOM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 26 Jul 2022 03:14:12 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80DB028E2E
        for <linux-watchdog@vger.kernel.org>; Tue, 26 Jul 2022 00:14:11 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4LsSnn3Mv5z4xD9;
        Tue, 26 Jul 2022 17:14:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1658819647;
        bh=HL9LUglH5FauIY1Yvh8EE8Z+9W1+HaJf5dkKU4DN+SQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=E6X1X4FmKuciil/HbOmlYEtHmXJ+BMR5vul48kjJMX1SO9Gsa+IpPyOW0VL8Uuohp
         bjHFehQqZcdZrded6uKD+1tQwNbYkS3Se7HRkp4DPOvKVC33vO7ohkHQaqlfVF8vgn
         zPrpJyastWguyBgeaSnjGf4M+WbG2tOyKsuSiVF31dR2KFoMXJ8wu+ocpkc+S8MQR0
         LZWo5hEjkP+Hc79FA18mr6uREAKIkFzVF5uboD2oknsPeCjSTF/u6Kcj8P+8Ueuivd
         k40igXxAcpFahcDUAjqX/Pq+NFpUtwDOjq1M6Bx5xsfqCM2JOh7PSHA1juVpFAolos
         5fq8KHTrrN00A==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Guenter Roeck <linux@roeck-us.net>,
        Scott Cheloha <cheloha@linux.ibm.com>
Cc:     linux-watchdog@vger.kernel.org, tzungbi@kernel.org,
        brking@linux.ibm.com, nathanl@linux.ibm.com, aik@ozlabs.ru,
        npiggin@gmail.com, vaishnavi@linux.ibm.com, wvoigt@us.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 4/4] watchdog/pseries-wdt: initial support for
 H_WATCHDOG-based watchdog timers
In-Reply-To: <20220725213026.GA1319556@roeck-us.net>
References: <20220713202335.1217647-1-cheloha@linux.ibm.com>
 <20220713202335.1217647-5-cheloha@linux.ibm.com>
 <28eb0fd6-4c4e-17d5-0f89-73eb68b051fa@roeck-us.net>
 <Yt7AvQjmYzUTYuVy@rascal-austin-ibm-com>
 <20220725213026.GA1319556@roeck-us.net>
Date:   Tue, 26 Jul 2022 17:14:03 +1000
Message-ID: <87bktcbb2c.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Guenter Roeck <linux@roeck-us.net> writes:
> On Mon, Jul 25, 2022 at 11:11:41AM -0500, Scott Cheloha wrote:
>> On Wed, Jul 13, 2022 at 01:50:14PM -0700, Guenter Roeck wrote:
>> > On 7/13/22 13:23, Scott Cheloha wrote:
>> > > PAPR v2.12 defines a new hypercall, H_WATCHDOG.  The hypercall permits
>> > > guest control of one or more virtual watchdog timers.  The timers have
>> > > millisecond granularity.  The guest is terminated when a timer
>> > > expires.
>> > > 
>> > > This patch adds a watchdog driver for these timers, "pseries-wdt".
>> > > 
>> > > pseries_wdt_probe() currently assumes the existence of only one
>> > > platform device and always assigns it watchdogNumber 1.  If we ever
>> > > expose more than one timer to userspace we will need to devise a way
>> > > to assign a distinct watchdogNumber to each platform device at device
>> > > registration time.
>> > > 
>> > > Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
>> > 
>> > Acked-by: Guenter Roeck <linux@roeck-us.net>
>> 
>> Guenter, Michael,
>> 
>> Which tree is taking this series?

powerpc.

It's been in next-test/next for about a week.

It's in linux-next today.

> The series includes non-watchdog changes, so my expectation was that some
> other tree would take it.

Yep, thanks for the ack.

cheers
