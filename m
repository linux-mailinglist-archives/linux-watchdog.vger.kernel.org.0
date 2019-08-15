Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4B18F342
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Aug 2019 20:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732921AbfHOSYo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Aug 2019 14:24:44 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42739 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729121AbfHOSYo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Aug 2019 14:24:44 -0400
Received: by mail-pl1-f193.google.com with SMTP id y1so1360478plp.9;
        Thu, 15 Aug 2019 11:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kKRdEB+5fpumZ2i4totbBIrGnA1HMKrFPQUwJDf1R7E=;
        b=WeI4HrKLBUSUz/Q+zYSFd4FS5FV1yVYzqwzMUTA+RmPNqz/4Pc9vVTRAJaPh69mmj7
         KI6ea+asiBWKGlfqWO9Q+wWyg2L2zOQ7W886SuL8OkxrIe+hfaLhzz6AXS2DtzvlTnL5
         SSwa41BGot1ICBlHAYt1THN539uLz8iNMeTt/LJyK0xMWv9A3lRYuYCT5zQgAWQQGE6x
         gyJlU4E/UpwSULSOwL0MuzLSxTLoIKMbhz/ccVm6F9tpyANbQwN/JuqOJCLNkMMmn8VO
         8eNTeUgqTT5Y/2T5MP7P/XfZz7ss2Np+GvrCBLcBS2UyO2aJZDeOs+1XWZluh03i9gje
         pVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=kKRdEB+5fpumZ2i4totbBIrGnA1HMKrFPQUwJDf1R7E=;
        b=DNhsIaKuLFcw8n7xh6OTbUA3iQFX8gux19ojfWEJCLKa49w4BQRA2g1OXbaHWzQFn1
         PsIOAAQgTjmBHO2Aexkrf9EPew9aWvtU3Ly2TDJh7Fr5DEblIy8PGy9YI9FOlutP2srn
         Z7ke/aZeeDxbiasaYleJDMGLMVuO610xn2tBv6SKZU61TPOXNhBnsgOuI1JwK4+Vy4iC
         uRat0xxkLyq+X1bu3je9wFCGx2yKYdpMMcJgMa51Y4ea0wz5C9cAFgy9EDEK7S9uKddn
         wnrTI06D+jpBwVsTFj1xD6n11YPWNNRVTaQ9LR6auQ0/j6W3YRreufn3AMO/vA7EiyMx
         Z8UQ==
X-Gm-Message-State: APjAAAUY4zvBqCmu1yIosWz3dZhX+5wCc9vGjVbNqPuNTGoJ8Guwy+IU
        5ySscUttsB5oz4r7qhpmAaZwbyin
X-Google-Smtp-Source: APXvYqzEQim9Yaq0DhDAq1ZPUsMDpbx6zkmbniZVWyDgPM5yHwTVjyLHrZ+myhIoOoeOVHksoCd1sg==
X-Received: by 2002:a17:902:f301:: with SMTP id gb1mr5338158plb.249.1565893483975;
        Thu, 15 Aug 2019 11:24:43 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q24sm1801884pjp.14.2019.08.15.11.24.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 11:24:43 -0700 (PDT)
Date:   Thu, 15 Aug 2019 11:24:42 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 20/22] watchdog: ziirave_wdt: Fix DOWNLOAD_START
 payload
Message-ID: <20190815182442.GP14388@roeck-us.net>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
 <20190812200906.31344-21-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812200906.31344-21-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 12, 2019 at 01:09:04PM -0700, Andrey Smirnov wrote:
> Bootloader firmware expects the following traffic for DOWNLOAD_END:
> 
> S Addr Wr [A] 0x10 [A] P
> 
> using ziirave_firm_write_byte() will result in
> 
> S Addr Wr [A] 0x10 [A] 0x01 [A] 0x01 [A] P
> 
> which happens to work because firmware will ignore any extra bytes
> sent. Fix this by converting the code to use i2c_smbus_write_byte()
> instead.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rick Ramstetter <rick@anteaterllc.com>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
