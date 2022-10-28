Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7465610C1B
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Oct 2022 10:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbiJ1IWp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Oct 2022 04:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiJ1IWp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Oct 2022 04:22:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9450F1A0C04
        for <linux-watchdog@vger.kernel.org>; Fri, 28 Oct 2022 01:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666945306;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D+rz3k9DjRQVPhRruqU1p4DCvDVIlIuyQRij1wmQScA=;
        b=IHxyGchi0v4P5bpge9XIIZD860YTAuHXmtmHHEG9ckJpub279/fum8xH9LDFwNmu+Vy9hC
        OWmuwZgc2ztAdSJ0QWS26EbLesr8rNhMbKokw1b5rSrHPLzFF5ppzd4Biyz9IN59MPA9KX
        9nXGRmSC81G/g/0kpg/gOHfR0gGYu2Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-7rWqRJE0Oeu0z6rYQMJdBw-1; Fri, 28 Oct 2022 04:21:44 -0400
X-MC-Unique: 7rWqRJE0Oeu0z6rYQMJdBw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F126D1C07577;
        Fri, 28 Oct 2022 08:21:43 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.145])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 07DDC40C83DC;
        Fri, 28 Oct 2022 08:21:42 +0000 (UTC)
Date:   Fri, 28 Oct 2022 09:21:40 +0100
From:   Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog: iTCO_wdt: Set NO_REBOOT if the watchdog is not
 already running
Message-ID: <Y1uRFBlW8lQVLrqh@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20221028062750.45451-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221028062750.45451-1-mika.westerberg@linux.intel.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Oct 28, 2022 at 09:27:50AM +0300, Mika Westerberg wrote:
> Daniel reported that the commit 1ae3e78c0820 ("watchdog: iTCO_wdt: No
> need to stop the timer in probe") makes QEMU implementation of the iTCO
> watchdog not to trigger reboot anymore when NO_REBOOT flag is initially
> cleared using this option (in QEMU command line):
> 
>   -global ICH9-LPC.noreboot=false
> 
> The problem with the commit is that it left the unconditional setting of
> NO_REBOOT that is not cleared anymore when the kernel keeps pinging the
> watchdog (as opposed to the previous code that called iTCO_wdt_stop()
> that cleared it).
> 
> Fix this so that we only set NO_REBOOT if the watchdog was not initially
> running.
> 
> Fixes: 1ae3e78c0820 ("watchdog: iTCO_wdt: No need to stop the timer in probe")
> Reported-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Tested-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

