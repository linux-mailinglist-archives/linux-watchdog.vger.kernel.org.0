Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD8E7054F
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jul 2019 18:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728918AbfGVQVz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Jul 2019 12:21:55 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40753 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727743AbfGVQVy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Jul 2019 12:21:54 -0400
Received: by mail-pl1-f195.google.com with SMTP id a93so19365444pla.7
        for <linux-watchdog@vger.kernel.org>; Mon, 22 Jul 2019 09:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=mIE/79TpJwEqfso29LMmfxo0VQm0L7jr7HWHb24hgB0=;
        b=Pkv0fAvpWKZ5suPEXw4XibqyUyl2AqN8C3xyMINQOEMmI6Ah7wNroRrE2VYpRJK6AO
         jWGMAFBt8JmuuXWxcZTlTQZ4/q7hHKQenBjjzaOe6z7KaUoOWp5vsQnmWtr9UPSe1j0K
         rmT0ZHBcTq2iYCQ7lHnAsAhqcNrLjOPrnFj+8VtNfAWKHXzQPlC8/qn2OZ7MsM2Wx1VD
         F4iGKcFNNiksaCYMtbpoPdw0sRlZnrWB0vL1dXGWpEFp5Mq7OXCeh8ao5uHAojQRUsY6
         2Y/OfJb6kq3kA+yZcR24+4mYf9cKeRzEBKmcBJfjAbT9kVommNLeRNZWKKNKfAyQ34nm
         OAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=mIE/79TpJwEqfso29LMmfxo0VQm0L7jr7HWHb24hgB0=;
        b=TdgpxHWSWZpF0a8IKPhKTUOTgGi84o/ybWjI8qkRM4B9Hym+tcx8nMVD11PujYLFMY
         8BVb5DT68HHoOzr5LcPFx5THQJGDnzMQvYlzB3Uq6/GmKIkscwrY+Df6quGb+Gr4v5wW
         IBAQmQ7aQxTh1JEvN2wRP51gyXhpfauciKJvPZzYbH0Qy0mBNNba03g29VfaG4ROEsfL
         bTKhtLfWGZzTKNooXGOdxML0TlwXkHZ6IAZWNjxJZCtfrxjBo+9qI2zXuJJY2E1H/y2q
         xtqu/xkyD6StIb6C8QuyZgiiMdLJt17+S3in8d0c4smXaCCJAqsC15mHPuP2cbfUyr9d
         Bozg==
X-Gm-Message-State: APjAAAUGdiu1Y4d4vh5BTVKZQ9Te4OmU5vdTfSbRQKSi7S59FahDbMpd
        WI5J3qnVu/sv+BR3i9XzC1GZbWRV
X-Google-Smtp-Source: APXvYqyHvRyLnOthcp2BmqOzXdJpxoMtDilye2xn0Ill0u3f/hZ3fxX/47T+jD+XE9vDx65qQl7ihQ==
X-Received: by 2002:a17:902:9a07:: with SMTP id v7mr66624816plp.245.1563812514199;
        Mon, 22 Jul 2019 09:21:54 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q69sm55285835pjb.0.2019.07.22.09.21.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 09:21:53 -0700 (PDT)
Date:   Mon, 22 Jul 2019 09:21:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Valentin =?utf-8?B?VmlkacSH?= <vvidic@valentin-vidic.from.hr>
Cc:     linux-watchdog@vger.kernel.org
Subject: Re: iTCO_wdt on Intel NUC
Message-ID: <20190722162152.GB8122@roeck-us.net>
References: <20190721203047.3jd6slko6guz52fl@valentin-vidic.from.hr>
 <d2f78a10-df19-9922-565d-b0ed6fcacb67@roeck-us.net>
 <20190722045557.tndjp4hnpngvlaql@valentin-vidic.from.hr>
 <20190722154549.GA5166@roeck-us.net>
 <20190722161026.3bzxwibivomuysqf@valentin-vidic.from.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190722161026.3bzxwibivomuysqf@valentin-vidic.from.hr>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 22, 2019 at 06:10:26PM +0200, Valentin Vidić wrote:
> On Mon, Jul 22, 2019 at 08:45:50AM -0700, Guenter Roeck wrote:
> > Weird. Is iTCO_wdt instantiated twice ?
> 
> I don't think so. I blacklisted iTCO_wdt module and rebooted but
> the iTCO_wdt line in /proc/iomem still appears although the module
> was not loaded.
> 
> I suspect that it might have to do with one of these modules?
> 
> drivers/platform/x86/intel_pmc_ipc.c:#define TCO_DEVICE_NAME                    "iTCO_wdt"
> drivers/mfd/lpc_ich.c:  .name = "iTCO_wdt",
> drivers/i2c/busses/i2c-i801.c:  pdev = platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
> 

Correct.

I suspect that the driver may be instantiated from two locations
on your system. On top of that, there is also wdat_wdt, which
instantiates a watchdog device through ACPI. Overall there are lots
of areas where things can go wrong with this driver.

Guenter
