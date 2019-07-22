Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC6B7707E4
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jul 2019 19:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730408AbfGVRwG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Jul 2019 13:52:06 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33737 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727021AbfGVRwG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Jul 2019 13:52:06 -0400
Received: by mail-pl1-f195.google.com with SMTP id c14so19448472plo.0
        for <linux-watchdog@vger.kernel.org>; Mon, 22 Jul 2019 10:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=aEoRAiP0Qset6Jb+Jxb/ytHPdQ3hKUPOUha9WyAc5Hg=;
        b=ft/LapNWajj3I2oL5+IEKP/KVQL7zS/HExKEzm5ot6BkP+TysenQ1vzK0XIoHLsfjU
         JECu8v5BKylk+i0O9GnBc4m8PH9Fr4xHTE223q1s0KIeb+dzYzGWVGGNwFnu2rc6QY45
         lTqBgn4hqGe+Hq8Q48YZ6PWE7Qoxusm/6KsZWmcWYIqcVtwW2z9uH2fBY/fYV357//YV
         dfoDxOyMxBrfo2j78VEh+Q1OVuDkdZ2Dc6dHINiwquIv3rNFKyQIYsu9pqzdh0Kh3sOa
         w8Idjjo+0tJZ2nsQB5KVRetoBfVHYY9eicmxewoKrMvmHEpWK4AYB2XXFHvl4sV6AU2F
         osTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=aEoRAiP0Qset6Jb+Jxb/ytHPdQ3hKUPOUha9WyAc5Hg=;
        b=Bi8awOEBQg1ISbHMEeJGGUy89JND54aNeZZG7bhg6v9v6ZxQmKORzIWi75CaSjRBNU
         veFzFQBzgVzdHX76u7o1e9vxWVnOxGkHPzAUVA6DDkdtW8FVHMO3hsU4TzQLgaiji2oD
         cCaI6TauvkWn2Aggl8HTx+1hxbcCI0SxGDz9TcuoMKLQ8QOMwo+bhQ6FewnT381Ax9kW
         lGslCvC9EAkpdW6M2os767XoGyKMWh0qPvc3a0Ym29dnlh5Ki62NcgGJfnBhN0D4ETrm
         1BRiQXq0X8yl+OlE27sZDfljAZ2eY5ccQXeqzIttaThqIURffhEyq612tWF58XA95M/V
         lE0A==
X-Gm-Message-State: APjAAAXA7dmLCF72WzrdptxRBDB2Qb90rJ71ChnpE4dm1Ok6MyWRpkVP
        SIPCztdA1bEwKq3kAt76dUH6vWlQ
X-Google-Smtp-Source: APXvYqzvV834vX+epF4+aUGrrwlJ0JNGZ/8I9+brS3DsEprkt3HMRt8RWSWpbVx0525jChmw22BEeg==
X-Received: by 2002:a17:902:2006:: with SMTP id n6mr78193360pla.232.1563817925778;
        Mon, 22 Jul 2019 10:52:05 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s185sm53981056pgs.67.2019.07.22.10.52.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 10:52:04 -0700 (PDT)
Date:   Mon, 22 Jul 2019 10:52:03 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Valentin =?utf-8?B?VmlkacSH?= <vvidic@valentin-vidic.from.hr>
Cc:     linux-watchdog@vger.kernel.org
Subject: Re: iTCO_wdt on Intel NUC
Message-ID: <20190722175203.GA12554@roeck-us.net>
References: <20190721203047.3jd6slko6guz52fl@valentin-vidic.from.hr>
 <d2f78a10-df19-9922-565d-b0ed6fcacb67@roeck-us.net>
 <20190722045557.tndjp4hnpngvlaql@valentin-vidic.from.hr>
 <20190722154549.GA5166@roeck-us.net>
 <20190722161026.3bzxwibivomuysqf@valentin-vidic.from.hr>
 <20190722162152.GB8122@roeck-us.net>
 <20190722174129.qzlg5exwx5ns3fkw@valentin-vidic.from.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190722174129.qzlg5exwx5ns3fkw@valentin-vidic.from.hr>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 22, 2019 at 07:41:29PM +0200, Valentin Vidić wrote:
> On Mon, Jul 22, 2019 at 09:21:52AM -0700, Guenter Roeck wrote:
> > I suspect that the driver may be instantiated from two locations
> > on your system. On top of that, there is also wdat_wdt, which
> > instantiates a watchdog device through ACPI. Overall there are lots
> > of areas where things can go wrong with this driver.
> 
> Yes, it seems to be related to i2c_i801 because that tries to
> load iTCO_wdt:
> 
> # modprobe i2c_i801
> [40450.070587] i801_smbus 0000:00:1f.4: SPD Write Disable is set
> [40450.070652] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
> [40450.072919] iTCO_vendor_support: vendor-support=0
> [40450.073485] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
> [40450.073546] iTCO_wdt iTCO_wdt: can't request region for resource [mem 0x00c5fffc-0x00c5ffff]
> [40450.073578] iTCO_wdt: probe of iTCO_wdt failed with error -16
> 

Is this the first mention of iTCO_wdt in the log ?
The easiest explanation that this point would be that lpc_ich instantiates
iTCO_wdt as well.

Guenter
