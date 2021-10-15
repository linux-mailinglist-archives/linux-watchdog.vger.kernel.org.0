Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14ED442FCDB
	for <lists+linux-watchdog@lfdr.de>; Fri, 15 Oct 2021 22:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234165AbhJOURp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 15 Oct 2021 16:17:45 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:43178 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233851AbhJOURp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 15 Oct 2021 16:17:45 -0400
Received: from [130.246.252.99] (stfc-guest-0076.rl.ac.uk [130.246.252.99])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id D6D2326202F;
        Fri, 15 Oct 2021 22:15:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1634328937;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cgs/PndWG4BeGphT6aIRGYaxMI2bBZNUmsRYCal6N3M=;
        b=prqcmCx+nsmAqAHrLUHYAoy+wz2BfTXVTqU8GH3AvLzClPxLk1FJbLy4VOUSnl+HgRZ/eP
        ijuLcU9N4p2cMYSFqN91UPMDqcdWZz77lSXoVwm1kKO4qmET2DYJwPWzuGUxxp6xvZP5Rx
        e1nBe7Dw7xmVL/l8aBZ4dGALCfkB1p2JmB0/0UoCoommr1ZCcZPD8AYCBn4IWq8mcMjbwP
        oICHhuPHg5ES5NV+no8QotHDONl+umvDq6wrfssxFkLJbjtaXRXzFln1y7N8n2qeP5Kpr9
        I0Kd+phAOWqOnRcULXj6waq+QDBRmjlGOYUeYaegWFQlnKu7gsVTIjgvECeJ/w==
Message-ID: <658d4e585fb9d8d295ebb56e7c944a784b9104a8.camel@svanheule.net>
Subject: Re: [PATCH 2/2] watchdog: Add Realtek Otto watchdog timer
From:   Sander Vanheule <sander@svanheule.net>
To:     kernel test robot <lkp@intel.com>, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     kbuild-all@lists.01.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Date:   Fri, 15 Oct 2021 21:15:35 +0100
In-Reply-To: <202110150030.GHlGSh0L-lkp@intel.com>
References: <7eb1e3d8a5bd3b221be0408bd6f0272e6d435ade.1634131707.git.sander@svanheule.net>
         <202110150030.GHlGSh0L-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 2021-10-15 at 00:44 +0800, kernel test robot wrote:
> Hi Sander,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v5.15-rc5 next-20211013]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:   
> https://github.com/0day-ci/linux/commits/Sander-Vanheule/Add-Realtek-Otto-WDT-support/20211013-213511
> base:  
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git f4d0cc426f77df68
> 90aa868f96c2de89686aae8a
> config: sh-allmodconfig (attached as .config)
> compiler: sh4-linux-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O
> ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         #
> https://github.com/0day-ci/linux/commit/32b957f54703ffbffecc825fb8df3106b2aab6b5
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Sander-Vanheule/Add-Realtek-Otto-WDT-
> support/20211013-213511
>         git checkout 32b957f54703ffbffecc825fb8df3106b2aab6b5
>         # save the attached .config to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir
> ARCH=sh SHELL=/bin/bash drivers/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> > > drivers/clk/clk.c:855:6: error: redefinition of 'clk_unprepare'
>      855 | void clk_unprepare(struct clk *clk)
>          |      ^~~~~~~~~~~~~
>    In file included from drivers/clk/clk.c:9:
>    include/linux/clk.h:303:20: note: previous definition of 'clk_unprepare' with
> type 'void(struct clk *)'
>      303 | static inline void clk_unprepare(struct clk *clk)
>          |                    ^~~~~~~~~~~~~
> > > drivers/clk/clk.c:936:5: error: redefinition of 'clk_prepare'
>      936 | int clk_prepare(struct clk *clk)
>          |     ^~~~~~~~~~~
>    In file included from drivers/clk/clk.c:9:
>    include/linux/clk.h:271:19: note: previous definition of 'clk_prepare' with type
> 'int(struct clk *)'
>      271 | static inline int clk_prepare(struct clk *clk)
>          |                   ^~~~~~~~~~~
> > > drivers/clk/clk.c:1182:6: error: redefinition of 'clk_is_enabled_when_prepared'
>     1182 | bool clk_is_enabled_when_prepared(struct clk *clk)
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    In file included from drivers/clk/clk.c:9:
>    include/linux/clk.h:284:20: note: previous definition of
> 'clk_is_enabled_when_prepared' with type 'bool(struct clk *)' {aka '_Bool(struct
> clk *)'}
>      284 | static inline bool clk_is_enabled_when_prepared(struct clk *clk)
>          |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for COMMON_CLK
>    Depends on !HAVE_LEGACY_CLK
>    Selected by
>    - REALTEK_OTTO_WDT && WATCHDOG && (MACH_REALTEK_RTL || COMPILE_TEST

I had used "select COMMON_CLK" in Kconfig, where other drivers use "depends on
COMMON_CLK". I've changed this to the latter now.

Since the tested config has both HAVE_LEGACY_CLK and COMMON_CLK set, I don't think
it's using a valid config anyway. After changing to "depends on COMMON_CLK", the
make.cross command listed above appears to build without problems.

Best,
Sander

