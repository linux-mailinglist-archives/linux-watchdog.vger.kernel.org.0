Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97759552361
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Jun 2022 19:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244883AbiFTR7V (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 Jun 2022 13:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244876AbiFTR7S (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 Jun 2022 13:59:18 -0400
Received: from smtp.smtpout.orange.fr (smtp05.smtpout.orange.fr [80.12.242.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEF9A1F2E1
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Jun 2022 10:59:13 -0700 (PDT)
Received: from [192.168.1.18] ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id 3LfzokdyR6rrE3LfzoiFNn; Mon, 20 Jun 2022 19:59:11 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Mon, 20 Jun 2022 19:59:11 +0200
X-ME-IP: 90.11.190.129
Message-ID: <8e35f372-0ce6-fd91-3ce0-3aae2f1f27c2@wanadoo.fr>
Date:   Mon, 20 Jun 2022 19:59:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 06/18] clk: npcm8xx: add clock controller
Content-Language: fr
To:     tmaimon77@gmail.com
Cc:     arnd@arndb.de, avifishman70@gmail.com, benjaminfair@google.com,
        biju.das.jz@bp.renesas.com, bjorn.andersson@linaro.org,
        catalin.marinas@arm.com, daniel.lezcano@linaro.org,
        devicetree@vger.kernel.org, geert+renesas@glider.be,
        gregkh@linuxfoundation.org, j.neuschaefer@gmx.net,
        jirislaby@kernel.org, joel@jms.id.au,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux@roeck-us.net, lkundrak@v3.sk,
        marcel.ziswiler@toradex.com, mturquette@baylibre.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, olof@lixom.net,
        p.zabel@pengutronix.de, robert.hancock@calian.com,
        robh+dt@kernel.org, sboyd@kernel.org, shawnguo@kernel.org,
        tali.perry1@gmail.com, tglx@linutronix.de, venture@google.com,
        vkoul@kernel.org, will@kernel.org, wim@linux-watchdog.org,
        yuenn@google.com
References: <20220619151225.209029-1-tmaimon77@gmail.com>
 <20220619151225.209029-7-tmaimon77@gmail.com>
 <6566c16c-f36f-6806-3879-3e6b40713e5e@wanadoo.fr>
 <CAP6Zq1jT3fbbRzDhriPT7JVYsrAOVGa4ukL_3yh_=wj-4f6zyA@mail.gmail.com>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <CAP6Zq1jT3fbbRzDhriPT7JVYsrAOVGa4ukL_3yh_=wj-4f6zyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Le 20/06/2022 à 14:48, Tomer Maimon a écrit :
> Hi Christophe,
> 
> Thanks for your comments.
> 
> On Sun, 19 Jun 2022 at 20:14, Christophe JAILLET
> <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org> wrote:
>>
>> Le 19/06/2022 à 17:12, Tomer Maimon a écrit :
>>> Nuvoton Arbel BMC NPCM8XX contains an integrated clock controller which
>>> generates and supplies clocks to all modules within the BMC.
>>>
>>> Signed-off-by: Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w-XMD5yJDbdMQAvxtiuMwx3w@public.gmane.organe.org>
>>> ---
>>>    drivers/clk/Kconfig       |   6 +
>>>    drivers/clk/Makefile      |   1 +
>>>    drivers/clk/clk-npcm8xx.c | 760 ++++++++++++++++++++++++++++++++++++++
>>>    3 files changed, 767 insertions(+)
>>>    create mode 100644 drivers/clk/clk-npcm8xx.c
>>>
>>
>> [...]
>>
>> Hi, below a few comments related to error handling and possible
>> dev_err_probe() usage to savec a few LoC.
>>
>> CJ
>>
>>> +static struct clk_hw *
>>> +npcm8xx_clk_register_pll(struct device *dev, void __iomem *pllcon,
>>> +                      const char *name, const char *parent_name,
>>> +                      unsigned long flags)
>>> +{
>>> +     struct npcm8xx_clk_pll *pll;
>>> +     struct clk_init_data init;
>>> +     struct clk_hw *hw;
>>> +     int ret;
>>> +
>>> +     pll = kzalloc(sizeof(*pll), GFP_KERNEL);
>>> +     if (!pll)
>>> +             return ERR_PTR(-ENOMEM);
>>> +
>>> +     pr_debug("%s reg, name=%s, p=%s\n", __func__, name, parent_name);
>>> +
>>> +     init.name = name;
>>> +     init.ops = &npcm8xx_clk_pll_ops;
>>> +     init.parent_names = &parent_name;
>>> +     init.num_parents = 1;
>>> +     init.flags = flags;
>>> +
>>> +     pll->pllcon = pllcon;
>>> +     pll->hw.init = &init;
>>> +
>>> +     hw = &pll->hw;
>>> +
>>> +     ret = devm_clk_hw_register(dev, hw);
>>> +     if (ret) {
>>> +             kfree(pll);
>>
>> Hi,
>>
>> there is no other kfree(() in this patch. It is handled by the framework
>> once the clk is registered or should there be another kfree() somewhere
>> or should pll be devm_alloc()'ed?
> Could use the devm_kzalloc but the hw is sent to the devm function and
> not the pll struct.

My point, as explained below is that some resources are managed (i.e. 
allocated by a devm_ function and released by the framework if the probe 
fails or if the driver is removed), but not all.

I think that it is not consistent and that maybe the release of the 
corresponding resources should be handled in a way or another.

>>
>>
>>> +             return ERR_PTR(ret);
>>> +     }
>>> +
>>> +     return hw;
>>> +}
>>> +
>>
>> [...]
>>
>>> +static int npcm8xx_clk_probe(struct platform_device *pdev)
>>> +{
>>> +     struct clk_hw_onecell_data *npcm8xx_clk_data;
>>> +     struct device *dev = &pdev->dev;
>>> +     void __iomem *clk_base;
>>> +     struct clk_hw *hw;
>>> +     int i;
>>> +
>>> +     npcm8xx_clk_data = devm_kzalloc(dev, struct_size(npcm8xx_clk_data, hws,
>>> +                                                      NPCM8XX_NUM_CLOCKS),
>>> +                                     GFP_KERNEL);
>>> +     if (!npcm8xx_clk_data)
>>> +             return -ENOMEM;
>>> +
>>> +     clk_base = devm_platform_ioremap_resource(pdev, 0);
>>> +     if (IS_ERR(clk_base))
>>> +             return PTR_ERR(clk_base);
>>> +
>>> +     npcm8xx_clk_data->num = NPCM8XX_NUM_CLOCKS;
>>> +
>>> +     for (i = 0; i < NPCM8XX_NUM_CLOCKS; i++)
>>> +             npcm8xx_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
>>> +
>>> +     /* Reference 25MHz clock */
>>> +     hw = clk_hw_register_fixed_rate(dev, "refclk", NULL, 0, NPCM8XX_REF_CLK);
>>
>> Other resoruces are managed, but not this one.
>> Is it on purpose?
> This is the fixed clock - the SoC Reference clock, what do you mean by
> not managed?

clk_hw_register_fixed_rate() allocates some memory. If an error occures 
later on or if the driver is .remove()'ed, this memory will leak. 
(unless I missed something).

Most of your other function calls use some devm_ variant, so the 
corresponding resources are released automatically in case of error or 
if the driver is unloaed.

>> Is an error handling path needed or a devm_add_action_or_reset()?
>>
>>> +     if (IS_ERR(hw))
>>> +             return PTR_ERR(hw);
>>> +     npcm8xx_clk_data->hws[NPCM8XX_CLK_REFCLK] = hw;
>>> +
>>> +     /* Register plls */
>>> +     for (i = 0; i < ARRAY_SIZE(npcm8xx_plls); i++) {
>>> +             const struct npcm8xx_clk_pll_data *pll_data = &npcm8xx_plls[i];
>>> +
>>> +             hw = npcm8xx_clk_register_pll(dev, clk_base + pll_data->reg,
>>> +                                           pll_data->name,
>>> +                                           pll_data->parent_name,
>>> +                                           pll_data->flags);
>>> +             if (IS_ERR(hw)) {
>>> +                     dev_err(dev, "npcm8xx_clk: Can't register pll\n");
>>> +                     return PTR_ERR(hw);
>>> +             }
>>> +
>>> +             if (pll_data->onecell_idx >= 0)
>>> +                     npcm8xx_clk_data->hws[pll_data->onecell_idx] = hw;
>>> +     }
>>> +
>>> +     /* Register fixed dividers */
>>> +     hw = devm_clk_hw_register_fixed_factor(dev, NPCM8XX_CLK_S_PLL1_DIV2,
>>> +                                            NPCM8XX_CLK_S_PLL1, 0, 1, 2);
>>> +     if (IS_ERR(hw)) {
>>> +             dev_err(dev, "npcm8xx_clk: Can't register fixed div\n");
>>> +             return PTR_ERR(hw);
>>
>> return dev_err_probe()?
> it will save online but still enter to a bigger function, I am not
> sure that the error will be EPROBE_DEFER, and we have returned the
> error in the code.

It is mostly a matter of taste, so if you don't think my proposal 
improves anything, just forget about it.

>>
>>> +     }
>>> +
>>> +     hw = devm_clk_hw_register_fixed_factor(dev, NPCM8XX_CLK_S_PLL2_DIV2,
>>> +                                            NPCM8XX_CLK_S_PLL2, 0, 1, 2);
>>> +     if (IS_ERR(hw)) {
>>> +             dev_err(dev, "npcm8xx_clk: Can't register pll div2\n");
>>> +             return PTR_ERR(hw);
>>
>> Same here and in other calls below.
>>
>>> +     }
>>> +
>>> +     hw = devm_clk_hw_register_fixed_factor(dev, NPCM8XX_CLK_S_PRE_CLK,
>>> +                                            NPCM8XX_CLK_S_CPU_MUX, 0, 1, 2);
>>> +     if (IS_ERR(hw)) {
>>> +             dev_err(dev, "npcm8xx_clk: Can't register ckclk div2\n");
>>> +             return PTR_ERR(hw);
>>> +     }
>>> +
>>> +     hw = devm_clk_hw_register_fixed_factor(dev, NPCM8XX_CLK_S_AXI,
>>> +                                            NPCM8XX_CLK_S_TH, 0, 1, 2);
>>> +     if (IS_ERR(hw)) {
>>> +             dev_err(dev, "npcm8xx_clk: Can't register axi div2\n");
>>> +             return PTR_ERR(hw);
>>> +     }
>>> +
>>> +     hw = devm_clk_hw_register_fixed_factor(dev, NPCM8XX_CLK_S_ATB,
>>> +                                            NPCM8XX_CLK_S_AXI, 0, 1, 2);
>>> +     if (IS_ERR(hw)) {
>>> +             dev_err(dev, "npcm8xx_clk: Can't register atb div2\n");
>>> +             return PTR_ERR(hw);
>>> +     }
>>> +
>>> +     /* Register muxes */
>>> +     for (i = 0; i < ARRAY_SIZE(npcm8xx_muxes); i++) {
>>> +             const struct npcm8xx_clk_mux_data *mux_data = &npcm8xx_muxes[i];
>>> +
>>> +             hw = clk_hw_register_mux_table(dev, mux_data->name,
>>> +                                            mux_data->parent_names,
>>> +                                            mux_data->num_parents,
>>> +                                            mux_data->flags,
>>> +                                            clk_base + NPCM8XX_CLKSEL,
>>> +                                            mux_data->shift,
>>> +                                            mux_data->mask, 0,
>>> +                                            mux_data->table,
>>> +                                            &npcm8xx_clk_lock);
>>> +
>> Same here. Error handling?
> what do you mean?

I mean the same as above. clk_hw_register_mux_table() allocates some 
memory. If an error occures later on or if the driver is .remove()'ed, 
this memory will leak. (unless I missed something).

Error handling was not a really good wording. You should read "should 
the resources allocated by this function be released if an error occures 
below"

>>
>>> +             if (IS_ERR(hw)) {
>>> +                     dev_err(dev, "npcm8xx_clk: Can't register mux\n");
>>> +                     return PTR_ERR(hw);
>>> +             }
>>> +
>>> +             if (mux_data->onecell_idx >= 0)
>>> +                     npcm8xx_clk_data->hws[mux_data->onecell_idx] = hw;
>>> +     }
>>> +
>>> +     /* Register clock dividers specified in npcm8xx_divs */
>>> +     for (i = 0; i < ARRAY_SIZE(npcm8xx_divs); i++) {
>>> +             const struct npcm8xx_clk_div_data *div_data = &npcm8xx_divs[i];
>>> +
>>> +             hw = clk_hw_register_divider(dev, div_data->name,
>>> +                                          div_data->parent_name,
>>> +                                          div_data->flags,
>>> +                                          clk_base + div_data->reg,
>>> +                                          div_data->shift, div_data->width,
>>> +                                          div_data->clk_divider_flags,
>>> +                                          &npcm8xx_clk_lock);
>>
>> devm_clk_hw_register_divider()?
> Will do.

Here, the devm_ alternative exist. But my point is the same as above. 
(release of resources in cae of error or if the driver is removed)

>>
>>> +             if (IS_ERR(hw)) {
>>> +                     dev_err(dev, "npcm8xx_clk: Can't register div table\n");
>>> +                     return PTR_ERR(hw);
>>> +             }
>>> +
>>> +             if (div_data->onecell_idx >= 0)
>>> +                     npcm8xx_clk_data->hws[div_data->onecell_idx] = hw;
>>> +     }
>>> +
>>> +     return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
>>> +                                        npcm8xx_clk_data);
>>> +}
>>> +
>>> +static const struct of_device_id npcm8xx_clk_dt_ids[] = {
>>> +     { .compatible = "nuvoton,npcm845-clk", },
>>> +     { }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, npcm8xx_clk_dt_ids);
>>> +
>>> +static struct platform_driver npcm8xx_clk_driver = {
>>> +     .probe  = npcm8xx_clk_probe,
>>> +     .driver = {
>>> +             .name = "npcm8xx_clk",
>>> +             .of_match_table = npcm8xx_clk_dt_ids,
>>> +     },
>>> +};
>>> +
>>> +static int __init npcm8xx_clk_driver_init(void)
>>> +{
>>> +     return platform_driver_register(&npcm8xx_clk_driver);
>>> +}
>>> +arch_initcall(npcm8xx_clk_driver_init);
>>> +
>>
> 
> Best regards,
> 
> Tomer
> 

