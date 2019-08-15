Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B863A8F33A
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Aug 2019 20:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729565AbfHOSXu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Aug 2019 14:23:50 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34807 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729121AbfHOSXt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Aug 2019 14:23:49 -0400
Received: by mail-pg1-f193.google.com with SMTP id n9so1659631pgc.1;
        Thu, 15 Aug 2019 11:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UGJ7znsjgXZPNBjaXocCfBsTQfoM5wdYdwwm1HiJS4E=;
        b=nSjDZTSFYJtoY3IowdzIDG6SgmO+5YLGJXfuZMkLnyV0ih89tHRYeFno5akxPfKohF
         rEea7uXCkvjZUjgoopWssOyh1I6R57AYFmq24pSyyRLuG9bVDqTTJ8BIIZvXQATJ1KAs
         wM5QMCc0KSQME5vWbYpQ+5kQTkkQdLzIyO6q6wU2BX9NxvIxJ+gsR9hZip25eRr/xGVT
         xbndVyXl//Rw1HhVeKrSrFTgEWhbXZs9QlyoEcIaSaRK6Xm/4vhnb9l0QcRwtDT3KM6N
         QWThRYQ/T77OKrSEnajJIFZbYJ74Ar1Ckj6QAst8pOGKtw+dJhr1H5gb0JSCSnFL7OhC
         q8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=UGJ7znsjgXZPNBjaXocCfBsTQfoM5wdYdwwm1HiJS4E=;
        b=tS/T5VcuK+jFgdRImX5SfsbTjQXyJDuUwc7XeJyXhxxWjJa7CvzIkFxDdEkrqmWNm+
         W6cL7vGTI55pea0CkR15flnYi1V+MuFvH2A8Z7EXNMlbjf9wg+EmJGhA0akQjt2OUlHK
         gLBZZ5Wdj/HfrhJ8ALVG7b/KzSeMsMN16O5IAje2kwQmLsnwRyFjak9rpS+X+EqBeEwE
         /irnRTJZY7KGFy7KNeBOtRJJOqP2aZ8qr6pJIMpUbHq6OXA8p3XQYy2j5OQQxt2JBZxZ
         LmDOHuW/G9v3hhyMsAK5AKBmfpzcQw8FSJy94hPhfwyxbCbIMY9TSysdAGV9mS33pDGL
         tWFw==
X-Gm-Message-State: APjAAAXfxX20F+3C+LFdSOxA2vt4CS6aRIutH5IdXqf7+5TQhfisxZo6
        TIe3fOkYEJh+Y0iBXHyYi3A=
X-Google-Smtp-Source: APXvYqyxIfMSJIu0Up2QfO88l8rSt/3hO9pZbeZoYF2SLpc/aGJBx6bYgY+YoFe2iJ7cH0z1jneVXg==
X-Received: by 2002:aa7:81d9:: with SMTP id c25mr6868327pfn.255.1565893429265;
        Thu, 15 Aug 2019 11:23:49 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k22sm3423926pfk.157.2019.08.15.11.23.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 11:23:48 -0700 (PDT)
Date:   Thu, 15 Aug 2019 11:23:47 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 18/22] watchdog: ziirave_wdt: Fix RESET_PROCESSOR
 payload
Message-ID: <20190815182347.GN14388@roeck-us.net>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
 <20190812200906.31344-19-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812200906.31344-19-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 12, 2019 at 01:09:02PM -0700, Andrey Smirnov wrote:
> Bootloader firmware expects the following traffic for
> RESET_PROCESSOR:
> 
> S Addr Wr [A] 0x0b [A] 0x01 [A] P
> 
> using ziirave_firm_write_byte() will result in
> 
> S Addr Wr [A] 0x0b [A] 0x01 [A] 0x01 [A] P
> 
> which happens to work because firmware will ignore any extra bytes and
> expected magic value matches byte count sent by
> i2c_smbus_write_block_data(). Fix this by converting the code to use
> i2c_smbus_write_byte_data() instead.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rick Ramstetter <rick@anteaterllc.com>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
