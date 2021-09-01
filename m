Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3A093FE367
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Sep 2021 21:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbhIATwF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 1 Sep 2021 15:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230353AbhIATwE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 1 Sep 2021 15:52:04 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8414AC061575
        for <linux-watchdog@vger.kernel.org>; Wed,  1 Sep 2021 12:51:07 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id q39so784690oiw.12
        for <linux-watchdog@vger.kernel.org>; Wed, 01 Sep 2021 12:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=F1x5iI6xAKghuO22TAFnUXwpiwYGPwzVQR81eaECfDU=;
        b=j6Bc2zxbPFRWIo2w5b8FSqfYMjtUwv7uQ0bVmwr6w/2N6Adu4Vg20dGiLXXjOdkVuF
         cBR+6w5UJZIm4h12psR1I24JShHMxRziXH8GIb0c+Ko2yY5hBMHNB2bw7krWUTg3EmK8
         kpuQ/peXqbVKvDXDTWMOEJhNf2s2eGKBdV+/ybL/R3BSKXwBbAUMu1nbVbTey7v5IJy7
         0zufsbPo5SGtru+suShFM3PRbjVJzpQ1UeE7qzbKyECs79gERHf5Gf+X1mF2tFfl6JSa
         U9SEa0zSDEHw7z/vxqEFVXQHXJpvXp0lyXrpVMMTy2hiy90ZugkRx/NJD+ZrGOZKULG8
         1Fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=F1x5iI6xAKghuO22TAFnUXwpiwYGPwzVQR81eaECfDU=;
        b=M8xswnzPXUcbWjG69HQpAtbH+EFHXCzrkWKHIWf+NZfxaWE5qS0YbQxpLiVXFoHP5Q
         VzSxmj/ZIAgGjUmuu3SC5JakBrzpOrq3Vphmb/hnyXMhIgtCJm3fItTW/usFiAO7E+G9
         znj2UV2lfUAZfvOW5DhNbEt10TaZzy5O/fdTwRsB2IBPIELCqFMSbCEA2vjf/w0klKql
         1FbnEyE/+2Ijty8Fh7ruTGxpr3OE0FKk41v1AcLPYCrBuboo8yzLd02knrKKU4BsD8ZO
         BIZyeQzx7fW3bRe2uyW4YGYYh77bzlxQ41PFDyYXngIW1PfQiFtGfUBDOYOZtZ28LvBj
         /bYQ==
X-Gm-Message-State: AOAM532U5C4E3zbpDP7HFdNqylwlprw8DcxjolxIUwZpxCXcz4Tmh4id
        Y/vNwIIXOi2FE0XzV44FfPA7GckJNRg=
X-Google-Smtp-Source: ABdhPJxt0C3o0tKQGPB64m7fCN9T6kzJpDr9CcqpdXUo2MW64hU1hTlVQE8vkr/OnGGQtTVudA4x+Q==
X-Received: by 2002:a05:6808:1414:: with SMTP id w20mr982654oiv.17.1630525866829;
        Wed, 01 Sep 2021 12:51:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m24sm93416oie.50.2021.09.01.12.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 12:51:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 1 Sep 2021 12:51:04 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Peter Robinson <perobins@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Jose Noguera <jnoguera@redhat.com>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [Watchdog drivers] - WDIOC_GETSUPPORT clarification
Message-ID: <20210901195104.GA1147939@roeck-us.net>
References: <CAKu6O181WOq36RCDO0VPcsZZoUFAJ88BMqv0Hqf+qYCeZsMJtQ@mail.gmail.com>
 <9866b7d2-1d43-db77-fa79-0be4bed51f5f@roeck-us.net>
 <0db70d23-d15c-e485-2600-439dc5d55d47@redhat.com>
 <3d7ec88a-8756-9a22-9e85-ab3b8c9953d2@roeck-us.net>
 <2c8c29d811c470f1df69ce5bb370f3f493fc55c2.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c8c29d811c470f1df69ce5bb370f3f493fc55c2.camel@redhat.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Sep 01, 2021 at 12:15:23PM +0100, Peter Robinson wrote:
> On Wed, 2021-08-18 at 07:53 -0700, Guenter Roeck wrote:
> > On 8/18/21 7:49 AM, Hans de Goede wrote:
> > > Hi,
> > > 
> > > On 8/18/21 4:13 PM, Guenter Roeck wrote:
> > > > On 8/18/21 2:57 AM, Jose Noguera wrote:
> > > > > Hello all!
> > > > > 
> > > > > I’m Jose, working in Red Hat on Fedora IoT and RHEL For Edge
> > > > > related projects.
> > > > > 
> > > > > While trying to add the feature of figuring out whether the
> > > > > current boot was triggered or not by a hardware watchdog using
> > > > > wdctl, we’ve found an odd behaviour in the drivers definition
> > > > > that we would like to check with you.
> > > > > 
> > > > > Looking specifically for the flag WDIOF_CARDRESET, we can find
> > > > > 40 files that contain it:
> > > > > 
> > > > > $ grep -rl CARDRESET drivers/watchdog/ | wc -l
> > > > > 40
> > > > > 
> > > > > but only 19 of them have the flag advertised in the options
> > > > > field of the watchdog_info struct returned by the
> > > > > WDIOC_GETSUPPORT ioctl.
> > > > > 
> > > > > This leads to wdctl not showing WDIOF_CARDRESET for drivers
> > > > > like i6300esb, even when the board had been reset this way:
> > > > > 
> > > > > $ sudo wdctl
> > > > > Device: /dev/watchdog0
> > > > > Identity: i6300ESB timer [version 0]
> > > > > Timeout: 30 seconds
> > > > > Pre-timeout: 0 seconds
> > > > > 
> > > > > FLAG DESCRIPTION STATUS BOOT-STATUS
> > > > > KEEPALIVEPING Keep alive ping reply 1 0
> > > > > MAGICCLOSE Supports magic close char 0 0
> > > > > SETTIMEOUT Set timeout (in seconds) 0 0
> > > > > 
> > > > > Working with Hans (in CC), we added a little patch (BugZilla
> > > > > ticket: 1993983) on wdctl and this would be the output of the
> > > > > command when it was a card reset triggered boot:
> > > > > 
> > > > > $ sudo wdctl
> > > > > Device: /dev/watchdog0
> > > > > Identity: i6300ESB timer [version 0]
> > > > > Thank you all for your time,
> > > > > 
> > > > > Jose
> > > > 
> > > > > Timeout: 30 seconds
> > > > > Pre-timeout: 0 seconds
> > > > > 
> > > > > FLAG DESCRIPTION STATUS BOOT-STATUS
> > > > > CARDRESET Card previously reset the CPU 1 1
> > > > > KEEPALIVEPING Keep alive ping reply 1 0
> > > > > MAGICCLOSE Supports magic close char 0 0
> > > > > SETTIMEOUT Set timeout (in seconds) 0 0
> > > > > 
> > > > > So our question is, may we know what is intended to be present
> > > > > in ident.options? What should the API call WDIOC_GETSUPPORT
> > > > > return in the options field?
> > > > > 
> > > > 
> > > > Search for WDIOC_GETSUPPORT in Documentation/watchdog/watchdog-
> > > > api.rst.
> > > > I don't see any ambiguity there. Patches welcome.
> > > 
> > > Ok, so drivers which may set CARDRESET in their GETBOOTSTATUS
> > > reply, but
> > > don't advertise this in their GETSUPPORT watchdog_info.options
> > > reply
> > > are buggy and should be fixed, got it. Thanks.
> > > 
> > > I've made a note about fixing this in a possible-kernel-projects
> > > document
> > > which I keep for when people who are interested in kernel
> > > development
> > > ask me for projects.
> > > 
> > 
> > With an add-on: If the driver in question is an old-style driver,
> > anyone
> > affected by the problem should really convert the driver to support
> > the watchdog subsystem.
> 
> Would you have a link to any docs/posts outlining what needs to be done
> for conversion to the watchdog subsystem?

Documentation/watchdog/convert_drivers_to_kernel_api.rst should help.

Guenter
