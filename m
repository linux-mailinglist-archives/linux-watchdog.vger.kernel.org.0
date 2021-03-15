Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C501233B050
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Mar 2021 11:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbhCOKsp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 06:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbhCOKsg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 06:48:36 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45547C061574;
        Mon, 15 Mar 2021 03:48:36 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so14527517pjg.5;
        Mon, 15 Mar 2021 03:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nGWke0czgNYyxSiHwwNFZAryWQ9+29nl3UKGpKstc10=;
        b=RfTHxJOAs1v6q8YtYod9qtIBNKoLZqKB61qtqNhD1sTAPQLw2R/U2GLWvS3G5ZTDgx
         taGpWoetfbN9R0Byff/i9kxyuEL0y1j7KDv2oaSuitEje9zXIKq9qVgivSEwdkGEDlam
         g7KMtY+OBNprKp9J02cvoa/hXfSQJk0x9Wxpvu6vGsiYba3UNFOeAoEMKPHq3IYWZ72N
         um/X5+wbVpIyWt50AJ6sWnhbhLp0oKDCJp4N+BfMlTOEjabx/LSH3KSMXvdW2U8aA4kE
         AqWIgF18pyG3KWJrdDBFGVJRXRcs2Zb4+ooW3yNt9vcoyYndq2H1PULKn6Pnv1Sjc9ii
         bS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nGWke0czgNYyxSiHwwNFZAryWQ9+29nl3UKGpKstc10=;
        b=P9HLb0Mc21VD622AtCZDE9FHu7cW8N8EVZgiqNG01iSbGcYN1nwBC+4qqOL6LpTU1o
         Espz1gr3KAeYq8BeuF/0cdn8WdgiwS+a95cpmoz2QFrPl9NN5AMEfD7uXpLqE/xIRMtX
         PBxoQOVI5lVLWHqZDPBqezS55OlsSYyr1WGtXN8t6WDEuWdpmkU7x0MBndCnu8+qtfTh
         JX/o/Yuh+Wc6tz2RWAGRM9hsqQxMSpNjoUScaFdGxiNAZ4pPm6XTwS/utmtkuxJ7w7V6
         0cD2D4tdqkl+Xzmuo0jMwpLqO2x4kK6pwQauA7TVZ+XjMX5QYldyGoY6CJK9Kn5nOSew
         7pBg==
X-Gm-Message-State: AOAM531tY32jxg7KH1YbUaO6eIj6i87JPDN+8kwQlQQPM4945cX/AhCa
        UFzr8KeCWs7qmtW4A9DtE9e2+dotigmJX4gD+00=
X-Google-Smtp-Source: ABdhPJxUg6z9VHVuMXl4qieB7QkWMCiDWAxE1J+2udCfiXk0uOsZtWPXCiYNikuRNWvvKdnV4LyQ2+U5C+FaZQe8g5g=
X-Received: by 2002:a17:902:c808:b029:e6:4204:f62f with SMTP id
 u8-20020a170902c808b02900e64204f62fmr11467621plx.0.1615805315699; Mon, 15 Mar
 2021 03:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210315095710.7140-1-henning.schild@siemens.com> <20210315095710.7140-3-henning.schild@siemens.com>
In-Reply-To: <20210315095710.7140-3-henning.schild@siemens.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 15 Mar 2021 12:48:19 +0200
Message-ID: <CAHp75VcBdR8xqfWqKe+DwGAUYByVL7SBK0p7tHcKPs7m4Ay1iw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] leds: simatic-ipc-leds: add new driver for Siemens
 Industial PCs
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Mar 15, 2021 at 11:57 AM Henning Schild
<henning.schild@siemens.com> wrote:
>
> This driver adds initial support for several devices from Siemens. It is
> based on a platform driver introduced in an earlier commit.

...

> +struct simatic_ipc_led {
> +       unsigned int value; /* mask for io and offset for mem */

> +       char name[32];

Hmm... Dunno if LED framework defines its own constraints for the
length of the name.

> +       struct led_classdev cdev;
> +};
> +
> +static struct simatic_ipc_led simatic_ipc_leds_io[] = {
> +       {1 << 15, "simatic-ipc:green:" LED_FUNCTION_STATUS "-1" },
> +       {1 << 7,  "simatic-ipc:yellow:" LED_FUNCTION_STATUS "-1" },
> +       {1 << 14, "simatic-ipc:red:" LED_FUNCTION_STATUS "-2" },
> +       {1 << 6,  "simatic-ipc:yellow:" LED_FUNCTION_STATUS "-2" },
> +       {1 << 13, "simatic-ipc:red:" LED_FUNCTION_STATUS "-3" },
> +       {1 << 5,  "simatic-ipc:yellow:" LED_FUNCTION_STATUS "-3" },

Can you use BIT() macro here? And can it be sorted by the bit order?

> +       {0, ""},

{ } is enough (no comma for terminator lines in general, and no need
to show structure member assignments separately in particular).

> +};
> +
> +/* the actual start will be discovered with pci, 0 is a placeholder */

PCI

> +struct resource simatic_ipc_led_mem_res =
> +       DEFINE_RES_MEM_NAMED(0, SZ_4K, KBUILD_MODNAME);

One line?

...

> +static struct simatic_ipc_led simatic_ipc_leds_mem[] = {
> +       {0x500 + 0x1A0, "simatic-ipc:red:" LED_FUNCTION_STATUS "-1"},
> +       {0x500 + 0x1A8, "simatic-ipc:green:" LED_FUNCTION_STATUS "-1"},
> +       {0x500 + 0x1C8, "simatic-ipc:red:" LED_FUNCTION_STATUS "-2"},
> +       {0x500 + 0x1D0, "simatic-ipc:green:" LED_FUNCTION_STATUS "-2"},
> +       {0x500 + 0x1E0, "simatic-ipc:red:" LED_FUNCTION_STATUS "-3"},
> +       {0x500 + 0x198, "simatic-ipc:green:" LED_FUNCTION_STATUS "-3"},
> +       {0, ""},

As per above.

> +};

...

> +       struct simatic_ipc_led *led =
> +               container_of(led_cd, struct simatic_ipc_led, cdev);

One line?

...

> +       struct simatic_ipc_led *led =
> +               container_of(led_cd, struct simatic_ipc_led, cdev);

One line?

...

> +       struct simatic_ipc_led *led =
> +               container_of(led_cd, struct simatic_ipc_led, cdev);

Ditto.


Btw, usually for such cases we create an inline helper
... to_simatic_ipc_led(...)
{
  return container_of(...);
}

...

> +static int simatic_ipc_leds_probe(struct platform_device *pdev)
> +{
> +       struct simatic_ipc_platform *plat;

const?

> +       struct device *dev = &pdev->dev;
> +       struct simatic_ipc_led *ipcled;
> +       struct led_classdev *cdev;
> +       struct resource *res;
> +       int err, type;
> +       u32 *p;

> +       plat = pdev->dev.platform_data;

Can be done directly in the definition block.

> +       switch (plat->devmode) {
> +       case SIMATIC_IPC_DEVICE_227D:
> +       case SIMATIC_IPC_DEVICE_427E:
> +               res = &simatic_ipc_led_io_res;
> +               ipcled = simatic_ipc_leds_io;
> +               /* the 227D is high on while 427E is low on, invert the struct
> +                * we have
> +                */
> +               if (plat->devmode == SIMATIC_IPC_DEVICE_227D) {

> +                       while (ipcled->value) {
> +                               ipcled->value = swab16(ipcled->value);
> +                               ipcled++;
> +                       }

This seems fishy. If you have a BE CPU it won't work the same way.
Better:
 a) to use cpu_to_le16 / be16
 b) create this as a helper that we may move to the generic header of byteorder.

But looking at the use of it, perhaps you rather need to redefine IO
accessors, i.e. ioread16()/iowrite16() vs. ioread16be()/iowrite16be().

> +                       ipcled = simatic_ipc_leds_io;
> +               }
> +               type = IORESOURCE_IO;
> +               if (!devm_request_region(dev, res->start,
> +                                        resource_size(res),
> +                                        KBUILD_MODNAME)) {
> +                       dev_err(dev,
> +                               "Unable to register IO resource at %pR\n",
> +                               res);
> +                       return -EBUSY;
> +               }
> +               break;
> +       case SIMATIC_IPC_DEVICE_127E:
> +               res = &simatic_ipc_led_mem_res;
> +               ipcled = simatic_ipc_leds_mem;
> +               type = IORESOURCE_MEM;
> +
> +               /* get GPIO base from PCI */
> +               res->start = simatic_ipc_get_membase0(PCI_DEVFN(13, 0));
> +               if (res->start == 0)
> +                       return -ENODEV;
> +
> +               /* do the final address calculation */
> +               res->start = res->start + (0xC5 << 16);

Magic. As I told you this is an actual offseet in the P2SB's bar for
GPIO registers.
I have a question, why we can't provide a GPIO driver which is already
in the kernel and, with use of the patch series I sent, to convert
this all magic to GPIO LEDs as it's done for all normal cases?

> +               res->end += res->start;
> +
> +               simatic_ipc_led_memory = devm_ioremap_resource(dev, res);
> +               if (IS_ERR(simatic_ipc_led_memory))
> +                       return PTR_ERR(simatic_ipc_led_memory);
> +
> +               /* initialize power/watchdog LED */
> +               p = simatic_ipc_led_memory + 0x500 + 0x1D8; /* PM_WDT_OUT */
> +               *p = (*p & ~1);
> +               p = simatic_ipc_led_memory + 0x500 + 0x1C0; /* PM_BIOS_BOOT_N */
> +               *p = (*p | 1);
> +
> +               break;
> +       default:
> +               return -ENODEV;
> +       }

> +}

-- 
With Best Regards,
Andy Shevchenko
