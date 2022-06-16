Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 101C954D745
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jun 2022 03:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344998AbiFPBoD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Jun 2022 21:44:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245496AbiFPBoC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Jun 2022 21:44:02 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B05B27FC7
        for <linux-watchdog@vger.kernel.org>; Wed, 15 Jun 2022 18:44:01 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id v143so222031oie.13
        for <linux-watchdog@vger.kernel.org>; Wed, 15 Jun 2022 18:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :references:content-language:in-reply-to:content-transfer-encoding;
        bh=gXVYkFRs5eS4i9vOtzWU8wc2en8knKz0IdeRZYig3zw=;
        b=CiaOunEhSXTyPNnx5rFEG0B9UVDQKzYpGZsG5F1wKcsaDpkOGyNsFiEwtJh0hE7k5b
         8b9+kwg80kz22BkJA/9bmfGbGB4HAX/LkZON5d9HHAd2Vrgn7lC6Q28pI1UuJn32bqVv
         cJXl2avFnwPdpnNGw0Zk7VB4pIBQaKe/+/qLZ1pU9LVLVkt9aH2inW7eq9inzHCHIwKw
         7XctJUiRDfBoTit/NNnwl5vVH0eGC0B92ZuK+78Zekegjev0smSDYZE0azYrrWZny3S4
         omiD4LGwIsG9n0ToRsY6X6+JOO7b4OEsGq7Si51DeaANhLSELga/vNJCOWWbVq2W+9iW
         R5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:references:content-language:in-reply-to
         :content-transfer-encoding;
        bh=gXVYkFRs5eS4i9vOtzWU8wc2en8knKz0IdeRZYig3zw=;
        b=tx2ZvFEnQ6h25i3m76NPXKuwkrmwvgoU+VD5XewsZnQpVsgsTnZcQjRmqRJmLLwlsw
         TzCLPzr9+yzHT4XOHCvF/KvNHdHKqzavEUQLucUf5YEQqUiIjomvHlCQjIFkrgftd/yl
         fBqXG22opkuJL9CxrAn3dGYtyzxZAMqh8k/4TE1c1P3Vg0rW3Q2tiTyzMuhnFy/rLgKc
         VXIhMECENyCtI/AZ+Q1BkqgvfD2FeW1dAX2y2UQ2d8NR3BBjQ2WqsoFCc4bOZYyiObd0
         5IMZ/9uaDtQRwv8dHaXbAQlXG09TozAi0JbQY+xoxigrPtSUuZtYHXo3Cfo17XwapZsg
         dOvA==
X-Gm-Message-State: AJIora/RJqVDEK4fvdXQfYBAFKooa8fCR+n6bHwTLBcfEm4LoZ3VAzyv
        p8C0enubaN/emPHKSEtlfHM=
X-Google-Smtp-Source: AGRyM1txnG6UObjonwhFou567AuThs8LjD7xptz6xCehF11b6Zuv4BpOfPgflhGTpSfYfpZOmaGQqw==
X-Received: by 2002:a05:6808:144f:b0:32f:56f5:7754 with SMTP id x15-20020a056808144f00b0032f56f57754mr1491822oiv.162.1655343840430;
        Wed, 15 Jun 2022 18:44:00 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:ccc8:8e07:268b:a09:2834? ([2804:431:c7c6:ccc8:8e07:268b:a09:2834])
        by smtp.gmail.com with ESMTPSA id bk14-20020a056820190e00b0041b8dcd467dsm366925oob.39.2022.06.15.18.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 18:44:00 -0700 (PDT)
Message-ID: <74ac21a1-d56f-50fb-71c2-e800e943f340@gmail.com>
Date:   Wed, 15 Jun 2022 22:43:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From:   Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 0/4] pseries-wdt: initial support for H_WATCHDOG-based
 watchdog timers
To:     Scott Cheloha <cheloha@linux.ibm.com>,
        linux-watchdog@vger.kernel.org
Cc:     nathanl@linux.ibm.com, wvoigt@us.ibm.com, aik@ozlabs.ru,
        vaishnavi@linux.ibm.com, npiggin@gmail.com, tzungbi@kernel.org,
        brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        linux@roeck-us.net
References: <20220602175353.68942-1-cheloha@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20220602175353.68942-1-cheloha@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

I tried this series out with mainline QEMU built with Alexey's patch [1]
and I wasn't able to get it to work. I'm using a simple QEMU command line
booting a fedora36 guest in a Power9 boston host:

sudo  ./qemu-system-ppc64 \
-M pseries,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off,ic-mode=dual \
-m 4G -accel kvm -cpu POWER9 -smp 1,maxcpus=1,threads=1,cores=1,sockets=1 \
-device virtio-scsi-pci,id=scsi0,bus=pci.0,addr=0x2 \
-drive file=/home/danielhb/fedora36.qcow2,if=none,id=drive-scsi0-0-0-0,format=qcow2,cache=none \
-device scsi-hd,bus=scsi0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0-0-0-0,id=scsi0-0-0-0,bootindex=2 \
-device qemu-xhci,id=usb,bus=pci.0,addr=0x4 -nographic -display none


Guest is running v5.19-rc2 with this series applied. Kernel config consists of
'pseries_le_defconfig' plus the following 'watchdog' related changes:

[root@fedora ~]# cat linux/.config | grep PSERIES_WDT
CONFIG_PSERIES_WDT=y

[root@fedora ~]# cat linux/.config | grep -i watchdog
CONFIG_PPC_WATCHDOG=y
CONFIG_HAVE_NMI_WATCHDOG=y
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
CONFIG_WATCHDOG_NOWAYOUT=y
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
# CONFIG_WATCHDOG_SYSFS is not set
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set
# Watchdog Pretimeout Governors
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
# Watchdog Device Drivers
# CONFIG_SOFT_WATCHDOG is not set
# CONFIG_XILINX_WATCHDOG is not set
# CONFIG_ZIIRAVE_WATCHDOG is not set
# CONFIG_CADENCE_WATCHDOG is not set
# CONFIG_DW_WATCHDOG is not set
# CONFIG_MAX63XX_WATCHDOG is not set
CONFIG_WATCHDOG_RTAS=y
# PCI-based Watchdog Cards
# CONFIG_PCIPCWATCHDOG is not set
# USB-based Watchdog Cards
# CONFIG_USBPCWATCHDOG is not set
# CONFIG_WQ_WATCHDOG is not set
[root@fedora ~]#



Kernel command line:

[root@fedora ~]# cat /proc/cmdline
BOOT_IMAGE=(ieee1275/disk,msdos2)/vmlinuz-5.19.0-rc2-00054-g12ede8ffb103 \
root=/dev/mapper/fedora_fedora-root ro rd.lvm.lv=fedora_fedora/root \
pseries-wdt.timeout=60 pseries-wdt.nowayout=1 pseries-wdt.action=2


With all that, executing

echo V > /dev/watchdog0

Does nothing. dmesg is clean and the guest doesn't reboot after the 60 sec
timeout.  I also tried with PSERIES_WDT being compiled as a module instead
of built-in. Same results.


What am I missing?


[1] https://patchwork.ozlabs.org/project/qemu-ppc/patch/20220608030153.1862335-1-aik@ozlabs.ru/



Thanks,


Daniel




On 6/2/22 14:53, Scott Cheloha wrote:
> PAPR v2.12 defines a new hypercall, H_WATCHDOG.  This patch series
> adds support for this hypercall to powerpc/pseries kernels and
> introduces a new watchdog driver, "pseries-wdt", for the virtual
> timers exposed by the hypercall.
> 
> This series is preceded by the following:
> 
> RFC v1: https://lore.kernel.org/linux-watchdog/20220413165104.179144-1-cheloha@linux.ibm.com/
> RFC v2: https://lore.kernel.org/linux-watchdog/20220509174357.5448-1-cheloha@linux.ibm.com/
> PATCH v1: https://lore.kernel.org/linux-watchdog/20220520183552.33426-1-cheloha@linux.ibm.com/
> 
> Changes of note from PATCH v1:
> 
> - Trim down the large comment documenting the H_WATCHDOG hypercall.
>    The comment is likely to rot, so remove anything we aren't using
>    and anything overly obvious.
> 
> - Remove any preprocessor definitions not actually used in the module
>    right now.  If we want to use other features offered by the hypercall
>    we can add them in later.  They're just clutter until then.
> 
> - Simplify the "action" module parameter.  The value is now an index
>    into an array of possible timeoutAction values.  This design removes
>    the need for the custom get/set methods used in PATCH v1.
> 
>    Now we merely need to check that the "action" value is a valid
>    index during pseries_wdt_probe().  Easy.
> 
> - Make the timeoutAction a member of pseries_wdt, "action".  This
>    eliminates the use of a global variable during pseries_wdt_start().
> 
> - Use watchdog_init_timeout() idiomatically.  Check its return value
>    and error out of pseries_wdt_probe() if it fails.
> 
> 
