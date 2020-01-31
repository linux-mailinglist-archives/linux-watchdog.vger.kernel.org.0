Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F13C314E91E
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Jan 2020 08:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbgAaH1n (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 31 Jan 2020 02:27:43 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:58664 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728027AbgAaH1m (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 31 Jan 2020 02:27:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=OV/p4y3YLF/I+G4fS8IrHQYiFOxdPLgiy0K6txXzDY8=; b=dSE512e1LHxS1dMPjUmjnrf8Z
        q2ssZVGtoRy07aoanuJfmpNvzkl4G8rwYM1vNsoRZSuOtiLqAXRflrqaGARPw06jTnRZM32PQab3I
        c7ohWKRhx/CzX2pgQ4jU2HWqFvWIcWXIF9NRLW+x6E5dT2OS7ARTCnjYeWmCi0ZlV+gP3hP+EziZn
        TWguo1jrQ81GyuIIy2gqnCaiaauPHXHZeslr4TzXWWtjxycJYa2Emoe+XFQxLBTBYqKUZBIAOduOK
        IOkmnhdMooTcXnVoAwQnI+jEpkRSVMnFnCet6nRi2t9Yl74T+svO95DtfCcFSrfVJNiM0ds6NO9CR
        UzdST+yMA==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ixQiK-00079w-QQ; Fri, 31 Jan 2020 07:27:40 +0000
Subject: Re: linux-next: Tree for Jan 31 (drivers/watchdog/da9062_wdt.c)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        S Twiss <stwiss.opensource@diasemi.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
References: <20200131150606.34caeb7c@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ac797eb0-9b0a-d2d3-3a40-3fbd0a8b5ee0@infradead.org>
Date:   Thu, 30 Jan 2020 23:27:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200131150606.34caeb7c@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 1/30/20 8:06 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add any v5.7 material to your linux-next included
> branches until after v5.6-rc1 has been released.
> 
> I am experimenting with a "make htmldocs" build at
> the end of the day, but it currently has an error:
> 
> docutils.utils.SystemMessage: Documentation/driver-api/thermal/cpu-idle-cooling.rst:95: (SEVERE/4) Unexpected section title.

I sent a patch for that on 2020-JAN-20 but no one has replied to the patch:

https://lore.kernel.org/linux-pm/712c1152-56b5-307f-b3f3-ed03a30b804a@infradead.org/



> Changes since 20200130:
> 


on i386:
when CONFIG_I2C is not set/enabled:

../drivers/watchdog/da9062_wdt.c: In function ‘da9062_wdt_restart’:
../drivers/watchdog/da9062_wdt.c:155:8: error: implicit declaration of function ‘i2c_smbus_write_byte_data’; did you mean ‘i2c_set_clientdata’? [-Werror=implicit-function-declaration]
  ret = i2c_smbus_write_byte_data(client, DA9062AA_CONTROL_F,
        ^~~~~~~~~~~~~~~~~~~~~~~~~
        i2c_set_clientdata
cc1: some warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:265: drivers/watchdog/da9062_wdt.o] Error 1


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
