Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0F2E70448
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jul 2019 17:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbfGVPpy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Jul 2019 11:45:54 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36068 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727123AbfGVPpy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Jul 2019 11:45:54 -0400
Received: by mail-pf1-f196.google.com with SMTP id r7so17567317pfl.3
        for <linux-watchdog@vger.kernel.org>; Mon, 22 Jul 2019 08:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=hobcJdQLeiCT2hAJw+JhWd+Cs3DiiolJ1ezHfZQe+y4=;
        b=h+X3Bs4vlf9FFmu29u0Zwc10ThfWAyA2hMlDZrIOZcbdNfcqx56krzq8PAPjLLt3gH
         kH9ED5S+G5+dcd5F3fOYBxypRMekIMUJMarLpj6gKgOqWyZGFpE9CaXoPrJeg1/2WTSL
         r8xnvf7+jy9g6O+VJQbcBTMfKMcPlUUR632lF8Mw/RCgNwXOkcSk01eBI/v7bIQjVVMF
         349nIAoabZJ7hXz0ufUNwvG360Wwa0YlIrZpoS4MyQWQN+MdFQf4e7R05MeI/habhKOf
         7JKuqN1xDfMnhg9v4BO/EQkdoMibUDhPprnPenr0Q+nEq+ikCkqgtARQk5Z8Yw5jGb9w
         rl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=hobcJdQLeiCT2hAJw+JhWd+Cs3DiiolJ1ezHfZQe+y4=;
        b=png6XSHPcviS63/P6mvSCujTaOCUhwg8hsNGQ3YOmV+rpwORRld9qYLYRZ0CKNat9k
         zgy7C2OCwqmXn4d5D9bz4uqvtnNGa6iOaIsydiE+5L2xKMLTBcwr2SNuGTAI+ufz4wZ7
         ZbXaPyYRxmPnONmvSrYtVQqETLWx1btL4LhpdHWYUhdXMwrzzk+4JRL3S2FNZzZUCXIE
         Js+lqPWaadX4h6bgZ8h905WoYJz1c6YCP53d8ypVcADdXbSKa8kPUovp4VS7DWAO7prF
         kKp909/KbRHx/IIwoV2BmAN1o5u/QzHZeyqm802lDhGKeXURmUpkos1nqOHsAU+das3G
         r2Xg==
X-Gm-Message-State: APjAAAU1SXawwJW9MI2FRz1c0FDc8EN5kTp8rPSkk8/GNOuAy5fy6AyP
        z7s/TdVYyxBOPq45bQtvZm4772Qu
X-Google-Smtp-Source: APXvYqxBwsoXWhMjDBqlq2Mlm8KRnB5nHMd5pIukPcVFpay+pzmBURvqn4l8lHI5P013M4wcWR25yQ==
X-Received: by 2002:a63:2148:: with SMTP id s8mr70621985pgm.336.1563810353084;
        Mon, 22 Jul 2019 08:45:53 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z13sm32103499pfa.94.2019.07.22.08.45.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 08:45:51 -0700 (PDT)
Date:   Mon, 22 Jul 2019 08:45:50 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Valentin =?utf-8?B?VmlkacSH?= <vvidic@valentin-vidic.from.hr>
Cc:     linux-watchdog@vger.kernel.org
Subject: Re: iTCO_wdt on Intel NUC
Message-ID: <20190722154549.GA5166@roeck-us.net>
References: <20190721203047.3jd6slko6guz52fl@valentin-vidic.from.hr>
 <d2f78a10-df19-9922-565d-b0ed6fcacb67@roeck-us.net>
 <20190722045557.tndjp4hnpngvlaql@valentin-vidic.from.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190722045557.tndjp4hnpngvlaql@valentin-vidic.from.hr>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 22, 2019 at 06:55:57AM +0200, Valentin Vidić wrote:
> On Sun, Jul 21, 2019 at 05:05:17PM -0700, Guenter Roeck wrote:
> > Most likely the memory region is reserved/used by something else. /proc/iomem
> > might show you.
> 
> The output is a bit strange since it mentions iTCO_wdt for that address range:
> 
> [    9.377397] iTCO_wdt iTCO_wdt: can't request region for resource [mem 0x00c5fffc-0x00c5ffff]
> 
> 00000000-00000fff : Reserved
> 00001000-0009efff : System RAM
> 0009f000-000fffff : Reserved
>   000a0000-000bffff : PCI Bus 0000:00
>   000e0000-000e3fff : PCI Bus 0000:00
>   000e4000-000e7fff : PCI Bus 0000:00
>   000e8000-000ebfff : PCI Bus 0000:00
>   000ec000-000effff : PCI Bus 0000:00
>   000f0000-000fffff : System ROM
> 00100000-6f8d8017 : System RAM
>   00c5fffc-00c5ffff : iTCO_wdt
> 6f8d8018-6f8e8e57 : System RAM
> 6f8e8e58-79d52fff : System RAM
> 79d53000-7a1bdfff : Reserved
> 7a1be000-7a23afff : ACPI Tables
> 7a23b000-7a2ebfff : ACPI Non-volatile Storage
> 7a2ec000-7ac0dfff : Reserved
> 7ac0e000-7ac0efff : System RAM
> 7ac0f000-7fffffff : Reserved
>   7c000000-7fffffff : Graphics Stolen Memory
> 

Weird. Is iTCO_wdt instantiated twice ?

I have no idea how to proceed, sorry.

Guenter
