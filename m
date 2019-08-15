Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39D428F2F9
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Aug 2019 20:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728818AbfHOSO0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Aug 2019 14:14:26 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35449 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbfHOSO0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Aug 2019 14:14:26 -0400
Received: by mail-pg1-f195.google.com with SMTP id n4so1648589pgv.2;
        Thu, 15 Aug 2019 11:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=W71ixp9w6pLBROLchdrbNCm52mF6ccjAYnrAjg/gRv8=;
        b=W7sdPkWCuoOBVGvikgqAZEwKGMNuswQSS6KeTZevrOSvwiphVhRy3xlPN53veDK0TU
         lwStSAPumWLQS3mtVu1x85bk4soGOnUrj4y7beLvkcoJ7eolSH4qGRanNBob0jBUNhSH
         sDQFtoUYmfKKIURYicn6/cRCvuzET5WzileMrTPLEJWGEQCshQuTaPlnRz6dCPh0biPM
         kzboB747veDWItgoVIAwpPBt2NEAXe/mbJYgK+UGYKyNOXVNdtnXuex39jtdxDt1XHDf
         YKrgeAW8pEGmwnfnwTBxNqDGm1T5N3lcpnRjwl2WvQgXa3a4qsHfKamqgKwynXlro2/N
         0EFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=W71ixp9w6pLBROLchdrbNCm52mF6ccjAYnrAjg/gRv8=;
        b=CNuo/0Hu5AemQaLR+h3v/7UwHRee3k0ep1IAQBK6R8YNG5k3Lir45wvkePi/0D6ruZ
         HwSL1rFOlWIEGMmyaiwsiROcwPqif7md0wwDh/+tK+pw4IavVybB0y9h+j74p9R0rwQU
         oyZbsbYzPUGOBDwyfurOb2HlhKeWexsBscyIu5+vIOllXQEKCaT4vVw4pYlOk/xJ8Fyx
         ncVy0T24mUnTPibmZfD6ymgeJ+3JkT7lNjPA/30YPrOixkrgE6Tff0ATus6JPrEdSQV4
         +KfMu/32k4Ac5hM3Ibe6If1QUE8dtco4UpAyd0gHj5WZ9aJ6Es2t/EtDmJiqj6fJBc3g
         aAjQ==
X-Gm-Message-State: APjAAAVOSRXXWGC5K037ytGSjq9omgFu27yk0XSSG84Jn24qRV8HIPIN
        nVKiod71gdmkidImd9ERojI=
X-Google-Smtp-Source: APXvYqwNJzeL1zilJqlvFkdpi5BPal2DzIVIBXh39Hwr8u2MD43aOC8GohjXHArpDMLl4Ytvf9nfeA==
X-Received: by 2002:a63:ff0c:: with SMTP id k12mr4327064pgi.186.1565892865433;
        Thu, 15 Aug 2019 11:14:25 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k64sm2826889pgk.74.2019.08.15.11.14.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 11:14:25 -0700 (PDT)
Date:   Thu, 15 Aug 2019 11:14:24 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/22] watchdog: ziirave_wdt: Simplify
 ziirave_firm_write_pkt()
Message-ID: <20190815181423.GB14388@roeck-us.net>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
 <20190812200906.31344-7-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812200906.31344-7-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 12, 2019 at 01:08:50PM -0700, Andrey Smirnov wrote:
> There no reason why ziirave_firm_write_pkt() has to take firmware
> data via 'struct ihex_binrec' and it can just take address, data pointer
> and data length as individual arguments. Make this change to allow us
> to drastically simplify handling page crossing case by removing all of
> the extra code required to split 'struct ihex_binrec' into two.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rick Ramstetter <rick@anteaterllc.com>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
